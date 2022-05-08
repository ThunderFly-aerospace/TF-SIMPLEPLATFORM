
// compile as Arduino Duemilanove, ATmega328p

#include <Servo.h>
#include <NMEAParser.h>

Servo servo;

/* A parser is declared with 2 handlers at most */
NMEAParser<2> parser;

#define open_btn_pin 8
#define confirm_btn_pin 9
#define base_led_1_pin 10
#define base_led_2_pin 11
#define confirm_led_1_pin A0
#define confirm_led_2_pin A1
#define servo_pin 12
#define buzzer_pin_1 A2



const int32_t servo_pwm_min = 1100; // locked
const int32_t servo_pwm_max = 1850; // opened


/* MESSAGE TYPES
    $PLSTS,[ID_MSG],[LOCK_STATE],[BLOCK_STATE],[OPEN_BTN_STATE],[CONFIRM_BTN_STATE],[SERVO_PWM]
    $PLLCK,[OPEN/LOCK],[REQ_CONFIRM],[REQ_TIME],[TIME IN MS]
    $PLBLK,[BLOCK/UNBLOCK]
*/

uint32_t msg_number = 0;
boolean lock_state = 1; // 0=opened, 1=locked
boolean lock_position = 0;
boolean block_state = 1;
boolean open_btn_state = 0;
boolean confirm_btn_state = 0;
uint32_t servo_pwm = servo_pwm_min;
uint32_t last_servo_change = 0;
boolean last_servo_state = 0;

boolean confirm_req = 0;
boolean time_req = 0;
int32_t remaining_time = 0;
boolean waiting_for_confirm = 0;

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

  pinMode(open_btn_pin, INPUT_PULLUP);
  pinMode(confirm_btn_pin, INPUT_PULLUP);

  pinMode(base_led_1_pin, OUTPUT);
  pinMode(base_led_2_pin, OUTPUT);
  pinMode(confirm_led_1_pin, OUTPUT);
  pinMode(confirm_led_2_pin, OUTPUT);
  pinMode(LED_BUILTIN, OUTPUT);

  servo.attach(servo_pin, servo_pwm_min, servo_pwm_max);

  parser.setErrorHandler(errorHandler);
  parser.addHandler("PLLCK", lockRequestHandler);
  parser.addHandler("PLBLK", blockRequestHandler);
}

void loop() {
  checkBlocking();

  readSerial();
  readBtns();

  checkTime();
  checkConfirm();

  sendStatusMsg();
  displayStatus();

  lockUpdate();

  delay(100);
}

void readBtns() {
  open_btn_state = !digitalRead(open_btn_pin);
  confirm_btn_state = !digitalRead(confirm_btn_pin);
}

void checkBlocking() {
  if (block_state == 1) {
    lock_state = 1;
  }
}

void lockUpdate() {
  if (open_btn_state) {
    resetParams();
    lock_state = 0;
  }

  if (lock_state != last_servo_state) {
    last_servo_state = lock_state;
    last_servo_change = msg_number;

    if (lock_state) {
      servo_pwm = servo_pwm_min;
    } else {
      servo_pwm = servo_pwm_max;
    }

    servo.writeMicroseconds(servo_pwm);
  }

  if ((msg_number - last_servo_change) == 5) {
    if (lock_state) {
      servo_pwm = servo_pwm_min+50;
    } else {
      servo_pwm = servo_pwm_max-50;
    }

    servo.writeMicroseconds(servo_pwm);
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
}

void resetParams() {
  lock_state = 1;
  lock_position = 0;
  block_state = 1;
  open_btn_state = 0;
  confirm_btn_state = 0;
  servo_pwm = servo_pwm_min;

  confirm_req = 0;
  time_req = 0;
  remaining_time = 0;
  waiting_for_confirm = 0;
}

void sendStatusMsg() {
  //$PLSTS,[ID_MSG],[LOCK_STATE],[BLOCK_STATE],[OPEN_BTN_STATE],[CONFIRM_BTN_STATE],[SERVO_PWM]
  String msg_str = "$PLSTS,";
  msg_str += msg_number;
  msg_str += ',';
  msg_str += lock_state;
  msg_str += ',';
  msg_str += block_state;
  msg_str += ',';
  msg_str += open_btn_state;
  msg_str += ',';
  msg_str += confirm_btn_state;
  msg_str += ',';
  msg_str += servo_pwm;

  int checksum = nmea0183_checksum(msg_str);

  msg_str += '*';
  msg_number++;

  Serial.print(msg_str);
  Serial.println(String(checksum, HEX));
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
  } else {
    digitalWrite(base_led_2_pin, LOW);
  }

  if (block_state == 1) {
    digitalWrite(base_led_1_pin, HIGH);
  } else {
    digitalWrite(base_led_1_pin, LOW);
  }
}
