import serial
import time

ser = serial.Serial('/dev/ttyUSB0', 115200, timeout=2)
print(ser.name)

while 1:
    data_in = ser.readline()
    print(data_in)


    if input() == "ubl":
        ser.write(b'$PLBLK,0*45\r\n'
        ser.flush()
        print("unblocked")
        time.sleep(1)
