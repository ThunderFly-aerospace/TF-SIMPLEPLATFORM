
// compile as MightyCore ////////////////////////////////
// Board: ATmega1284
// Clock: External 16MHZ
// BOD: BOD 2.7V
// EEPROM: EEPROM retained
// Compiler LTO: LTO disabled
// Variant: 1284p
// Pinout: Standard pinout
// Bootloader: Yes (UART0)
//////////////////////////////////////////////////////////

#include <Servo.h>
#include <NMEAParser.h>

Servo servo_lock;
Servo servo_rotor;

/* A parser is declared with 2 handlers at most */
NMEAParser<2> parser;

#define reset_btn_pin 22
#define prep_btn_pin 18
#define confirm_btn_pin 23
#define base_led_1_pin 20
#define base_led_2_pin 21
#define confirm_led_1_pin 26
#define confirm_led_2_pin 19
#define servo_lock_pin 12
#define servo_rotor_pin 13
#define buzzer_pin_1 A0

#define led_1 28
#define led_2 29
#define led_3 30
#define led_4 31

const int32_t servo_lock_pwm_min = 500; // opened
const int32_t servo_lock_pwm_max = 970; // locked
const int32_t servo_rotor_pwm_min = 500; // locked
const int32_t servo_rotor_pwm_max = 2500; // opened


/* MESSAGE TYPES
    $PLSTS,[ID_MSG],[LOCK_STATE],[BLOCK_STATE],[reset_btn_state],[CONFIRM_BTN_STATE],[SERVO_PWM]
    $PLLCK,[OPEN/LOCK],[REQ_CONFIRM],[REQ_TIME],[TIME IN MS]
    $PLBLK,[BLOCK/UNBLOCK]
*/

uint32_t msg_number = 0;
boolean lock_state = 1; // 0=opened, 1=locked
boolean lock_position = 0;
boolean rotor_lock_state = 1; // 0=opened, 1=locked
boolean rotor_lock_position = 0;
boolean prep_rotor_lock = 0;
boolean block_state = 1;
boolean reset_btn_state = 0;
boolean prep_btn_state = 0;
uint32_t prep_btn_counter = 0;
boolean prep_btn_lock = 0;
boolean confirm_btn_state = 0;
uint32_t servo_lock_pwm = servo_lock_pwm_min;
uint32_t servo_rotor_pwm = servo_rotor_pwm_min;

boolean confirm_req = 0;
boolean time_req = 0;
int32_t remaining_time = 0;
boolean waiting_for_confirm = 0;
uint32_t confirm_beep_time = 200;
boolean confirm_beep = 0;
uint32_t confirm_beep_delay = 10;
uint32_t confirm_beep_interval = 1000;
uint32_t confirm_beep_counter = 0;
uint32_t time_change = 0;
uint32_t last_time_msg_send = 0;
uint32_t actual_time = 0;

void readSerial() {
  while (Serial.available()) {
    parser << Serial.read();
  }
}

void errorHandler() {
  Serial.print("ERR(parser): ");
  Serial.println(parser.error());
}

void lockRequestHandler() {
  //$PLLCK,[OPEN/LOCK],[REQ_CONFIRM],[REQ_TIME],[TIME IN MS]
  int msg_open = 0;
  int msg_req_confirm = 0;
  int msg_req_time = 0;
  int msg_ms_time = 0;

  parser.getArg(0, msg_open);
  parser.getArg(1, msg_req_confirm);
  parser.getArg(2, msg_req_time);
  parser.getArg(3, msg_ms_time);

  if (msg_open == 1) {
    lock_state = 1;
  } else {
    if (block_state == 1) {
      Serial.println("ERR: Unable to unlock because blocking is active.");
    } else {
      if (msg_req_confirm == 0 && msg_req_time == 0) {
        lock_state = 0;
      } else {
        confirm_req = msg_req_confirm;
        time_req = msg_req_time;
        remaining_time = msg_ms_time;
      }
    }
  }
}

void blockRequestHandler() {
  //$PLBLK,[BLOCK/UNBLOCK]
  int msg_block = 0;

  parser.getArg(0, msg_block);

  block_state = msg_block;

  if (block_state == 1 && lock_state == 0) {
    lock_state = 1;
  }
}

void setup() {
  Serial.begin(115200);

  pinMode(reset_btn_pin, INPUT_PULLUP);
  pinMode(prep_btn_pin, INPUT_PULLUP);
  pinMode(confirm_btn_pin, INPUT_PULLUP);

  pinMode(base_led_1_pin, OUTPUT);
  pinMode(base_led_2_pin, OUTPUT);
  pinMode(confirm_led_1_pin, OUTPUT);
  pinMode(confirm_led_2_pin, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);
  pinMode(buzzer_pin_1, OUTPUT);

  servo_lock.attach(servo_lock_pin, servo_lock_pwm_min, servo_lock_pwm_max);
  servo_rotor.attach(servo_rotor_pin, servo_rotor_pwm_min, servo_rotor_pwm_max);

  parser.setErrorHandler(errorHandler);
  parser.addHandler("PLLCK", lockRequestHandler);
  parser.addHandler("PLBLK", blockRequestHandler);

  // initialize timer1
  noInterrupts(); // disable all interrupts
  TCCR2A = 0;
  TCCR2B = 0;
  TCNT2 = 256;   // preload timer
  OCR2A = 250;
  TCCR2B |= (1 << CS22);    // 256 prescaler
  TCCR2B |= (1 << CS21);
  //TCCR2B |= (1 << CS20);
  TIMSK2 |= (1 << TOIE1);   // enable timer overflow interrupt
  interrupts(); // enable all interrupts
}

void loop() {
  checkBlocking();

  readSerial();
  readBtns();

  checkTime();
  checkConfirm();
  checkOpenBtn();
  checkPrepBtn();

  actual_time = millis();
  time_change = actual_time - last_time_msg_send;
  if (time_change > 100) {
    sendStatusMsg();
  }
  displayStatus();

  lockUpdate();
  rotorLockUpdate();
}

void readBtns() {
  reset_btn_state = !digitalRead(reset_btn_pin);
  prep_btn_state = !digitalRead(prep_btn_pin);
  confirm_btn_state = !digitalRead(confirm_btn_pin);
}

void checkBlocking() {
  if (block_state == 1) {
    lock_state = 1;
  }
}

void checkOpenBtn() {
  if (reset_btn_state) {
    resetParams();
    lock_state = 0;
  }
}

void checkPrepBtn() {
  if (prep_btn_state == 1 && prep_btn_counter == 0 && prep_btn_lock == 0) {
    prep_btn_counter = 3;
    rotor_lock_state = !rotor_lock_state;
    prep_btn_lock = 1;
    prep_rotor_lock = 1;
  } else if (prep_btn_state == 0 && prep_btn_counter == 0 && prep_btn_lock == 1) {
    prep_btn_lock = 0;
  } else if (prep_btn_counter > 0) {
    prep_btn_counter--;
  }
}

void lockUpdate() {
  if (!lock_state) {
    servo_lock.writeMicroseconds(servo_lock_pwm_min);
  } else {
    servo_lock.writeMicroseconds(servo_lock_pwm_max);
  }

}

void rotorLockUpdate() {
  if (rotor_lock_state == 1) {
    servo_rotor.writeMicroseconds(servo_rotor_pwm_max);
  } else {
    servo_rotor.writeMicroseconds(servo_rotor_pwm_min);
  }
}

void checkTime() {
  if (time_req == 1) {
    if (remaining_time > 0) {
      if (confirm_req == 0) {
        lock_state = 0;
        // TODO: connect to IMU clock
        remaining_time -= 101;
      }
    }

    if (remaining_time < 0) {
      time_req = 0;
      block_state = 1;
      lock_state = 1;
    }
  }
}

void checkConfirm() {
  if (confirm_req == 1 && confirm_btn_state == 1 && block_state == 0) {
    lock_state = 0;
    confirm_req = 0;
  }

  if (confirm_btn_state == 1 && block_state == 0) {
    rotor_lock_state = 0;
  }
}

void resetParams() {
  lock_state = 1;
  lock_position = 0;
  rotor_lock_position = 0;
  block_state = 1;
  reset_btn_state = 0;
  confirm_btn_state = 0;

  confirm_req = 0;
  time_req = 0;
  remaining_time = 0;
  waiting_for_confirm = 0;
}

void sendStatusMsg() {
  //$PLSTS,[ID_MSG],[LOCK_STATE],[BLOCK_STATE],[reset_btn_state],[CONFIRM_BTN_STATE],[SERVO_PWM]

  String msg_str = "$PLSTS,";
  msg_str += msg_number;
  msg_str += ',';
  msg_str += lock_state;
  msg_str += ',';
  msg_str += rotor_lock_state;
  msg_str += ',';
  msg_str += block_state;
  msg_str += ',';
  msg_str += reset_btn_state;
  msg_str += ',';
  msg_str += confirm_btn_state;
  msg_str += ',';
  msg_str += servo_lock_pwm;
  msg_str += ',';
  msg_str += servo_rotor_pwm;

  int checksum = nmea0183_checksum(msg_str);

  msg_str += '*';
  msg_number++;

  Serial.print(msg_str);
  Serial.println(String(checksum, HEX));
  last_time_msg_send = millis();
}

int nmea0183_checksum(String nmea_data) {
  int crc = 0;
  int i;

  // ignore the first $ sign,  no checksum in sentence
  for (i = 1; i < nmea_data.length(); i ++) { // removed the - 3 because no cksum is present
    crc ^= nmea_data[i];
  }

  return crc;
}

void displayStatus() {
  if (lock_state == 1) {
    digitalWrite(base_led_2_pin, HIGH);
    digitalWrite(confirm_led_2_pin, HIGH);
    digitalWrite(led_2, HIGH);
    //digitalWrite(buzzer_pin_1, LOW);
  } else {
    digitalWrite(base_led_2_pin, LOW);
    digitalWrite(confirm_led_2_pin, LOW);
    digitalWrite(led_2, LOW);
    //digitalWrite(buzzer_pin_1, HIGH);
  }

  if (block_state == 1) {
    digitalWrite(base_led_1_pin, HIGH);
    digitalWrite(led_1, HIGH);
  } else {
    digitalWrite(base_led_1_pin, LOW);
    digitalWrite(led_1, LOW);
  }

  if (block_state == 0) {
    confirm_beep = 1;

    if (rotor_lock_state) {
      confirm_beep_interval = 50;
    } else {
      confirm_beep_interval = 20;
    }
  } else {
    confirm_beep = 0;
  }
}

ISR(TIMER2_OVF_vect) {
  confirm_beep_counter++;
  if (confirm_beep) {
    if (confirm_beep_counter % confirm_beep_interval == 0) {
      digitalWrite(confirm_led_1_pin, HIGH);
      digitalWrite(buzzer_pin_1, HIGH);
      //digitalWrite(buzzer_pin_1, digitalRead(buzzer_pin_1) ^ 1);
    } else if (confirm_beep_counter % (confirm_beep_interval + confirm_beep_delay) == 0) {
      digitalWrite(confirm_led_1_pin, LOW);
      digitalWrite(buzzer_pin_1, LOW);
      confirm_beep_counter = 0;
    }
  } else {
    if (lock_state) {
      digitalWrite(confirm_led_1_pin, LOW);
      digitalWrite(buzzer_pin_1, LOW);
    } else {
      digitalWrite(confirm_led_1_pin, HIGH);
      digitalWrite(buzzer_pin_1, HIGH);
    }
  }
}
