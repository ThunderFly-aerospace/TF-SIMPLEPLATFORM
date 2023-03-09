// compile as Arduino Duemilanove, ATmega328p

#include <Servo.h>

Servo servo;

#define open_btn_pin 8
#define confirm_btn_pin 9
#define base_led_1_pin 10
#define base_led_2_pin 11
#define confirm_led_1_pin A0
#define confirm_led_2_pin A1
#define servo_pin 12
#define buzzer_pin_1 A2

const int32_t servo_pwm_min = 1150; // opened
const int32_t servo_pwm_max = 1900; // locked

uint32_t msg_number = 0;
uint32_t open_btn = 0;
boolean confirm_btn = 0;
boolean lock_state = 0; // 0=opened, 1=locked
int32_t servo_pwm = servo_pwm_min;
boolean blocked_opening = 1;

boolean confirm_btn_pushed;
uint32_t tick = 0;
uint8_t time_to_unlock = 0;
boolean requested_confirmation = 0;
boolean unlocked_for_time = 0;

char msg_buffer[1000];

class serial_msg {
  public:
    serial_msg(char *msg);
    parse_msg();
    uint32_t msg_type_id;
    uint32_t msg_value_arr[10];
    char *raw_msg;
};

serial_msg::serial_msg(char *msg) {
  this->raw_msg = msg;

  parse_msg();
}

serial_msg::parse_msg() {
  int parsed_chars = 0;
  
  while(parsed_chars < sizeof(raw_msg)) {
    
    parsed_chars++;
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
}

void loop() {
  tick++;

  readBtns();

  if (Serial.available() > 0) {
    readSerial();
  }
  
  //readSerialOld();
  
  checksOpening();

  lockUpdate();

  confirmLedsUpdate();
  baseLedsUpdate();
  
  if (tick % 5 == 0) {
    heartbeat_msg();
  }

  delay(100);
}

void readSerial() {
  while (Serial.available() > 0) {
    
    
  }
}

void readBtns() {
  open_btn = !digitalRead(open_btn_pin);
  confirm_btn = !digitalRead(confirm_btn_pin);
}

void readSerialOld() {
  if(Serial.available() > 0) {
    String msg_string = "";
    while(Serial.available() > 0) {
      msg_string += char(Serial.read());
    }

    if (msg_string.startsWith("$BL")) {
      blocked_opening = 1;
      confirm_btn_pushed = 0;
      Serial.println("Block confirmed.");
    }

    if (msg_string.startsWith("$UL")) {
      blocked_opening = 0;
      confirm_btn_pushed = 0;
      Serial.println("Unblock confirmed.");
    }

    if (msg_string.startsWith("$GS")) {
      heartbeat_msg();
    }

    if (msg_string.startsWith("$C")) {
      lock_state = 1;
      Serial.println("Lock confirmed.");
    }
    
    if (msg_string.startsWith("$O")) {
      int index = msg_string.indexOf(';');
      msg_string.remove(0, index+1);
      index = msg_string.indexOf(';');
      
      time_to_unlock = msg_string.substring(0, index).toInt()*10;
      msg_string.remove(0, index+1);
      index = msg_string.indexOf(';');
      
      requested_confirmation = msg_string.substring(0, index).toInt();
      msg_string.remove(0, index+1);

      if (!blocked_opening) {
        unlocked_for_time = 1;
        Serial.print("Unlock for ");
        Serial.print(time_to_unlock/10);
        Serial.println(" seconds confirmed.");
      } else {
        Serial.println("Unlocking blocked.");
        time_to_unlock = 0;
        requested_confirmation = 0;
        unlocked_for_time = 0;
      }
    }

    msg_string = "";
  }
}

void checksOpening() {
  if (confirm_btn) {
    blocked_opening = 0;
    confirm_btn_pushed = 1;
  } else if (confirm_btn_pushed == 1){
    blocked_opening = 1;
    confirm_btn_pushed = 0;
  }
  
  if (blocked_opening) {
    lock_state = 1;
  }

  if (time_to_unlock > 0) {
    if (requested_confirmation) {
      if (confirm_btn) {
        requested_confirmation = 0;
        time_to_unlock--;
        lock_state = 0;
      }
    } else {
      time_to_unlock--;
      lock_state = 0;
    }
  }

  if (time_to_unlock == 0 || unlocked_for_time) {
    lock_state = 1;
    unlocked_for_time = 0;
  }
  
  if (open_btn) {
    lock_state = 0;
  }
}

void lockUpdate() {
  if(lock_state) {
    servo_pwm = servo_pwm_max;
  } else {
    servo_pwm = servo_pwm_min;
  }
  
  servo.writeMicroseconds(servo_pwm);
}

void confirmLedsUpdate() {
  if (confirm_btn) {

    // ready to release
    digitalWrite(confirm_led_1_pin, HIGH);

    if(!lock_state) {
        digitalWrite(confirm_led_2_pin, HIGH);
    } else {
      if (tick % 2 == 0) {
        digitalWrite(confirm_led_2_pin, HIGH);
      } else {
        digitalWrite(confirm_led_2_pin, LOW);
      }
    }
  } else {

    // normal blinking
    if (tick % 10 >= 8) {
      digitalWrite(confirm_led_1_pin, HIGH);
      digitalWrite(confirm_led_2_pin, HIGH);
    } else {
      digitalWrite(confirm_led_1_pin, LOW);
      digitalWrite(confirm_led_2_pin, LOW);
    }
  }
}

void baseLedsUpdate() {
  if (lock_state) {
    digitalWrite(base_led_2_pin, HIGH);
    digitalWrite(buzzer_pin_1, LOW);
  } else {
    digitalWrite(base_led_2_pin, LOW);
    digitalWrite(buzzer_pin_1, HIGH);
  }
  
  if (open_btn) {
    digitalWrite(base_led_1_pin, LOW);
  } else if (blocked_opening) {
    // solid red = blocked opening
    digitalWrite(base_led_1_pin, HIGH);
  } else {
    // normal blinking
    if (tick % 2 == 0) {
      digitalWrite(base_led_1_pin, HIGH);
    } else {
      digitalWrite(base_led_1_pin, LOW);
    }
  }
}

void heartbeat_msg() {
  Serial.print("$S;");
  Serial.print(msg_number);
  msg_number++;
  Serial.print(";");
  Serial.print(open_btn);
  Serial.print(";");
  Serial.print(confirm_btn);
  Serial.print(";");
  Serial.print(lock_state);
  Serial.print(";");
  Serial.print(servo_pwm);
  Serial.print(";");
  Serial.print(blocked_opening);
  Serial.println(";");
}
