#include "StringSplitter.h"
#include <Wire.h>

String a;
String  wire_in;

void setup() {
  Serial.begin(115200); // opens serial port, sets data rate to 9600 bps
  Serial.setTimeout(50);

  // Start the I2C Bus as Master
  Wire.begin();
}

void loop() {
  while (Serial.available()) {
    a = Serial.readString();// read the incoming data as string
    a.trim();
    StringSplitter *splitter = new StringSplitter(a, '|', 3);
    String command = splitter->getItemAtIndex(0);

    if (command.equals("k")) {
      Serial.println(splitter->getItemAtIndex(1));
      Wire.beginTransmission(4); // transmit to device #4
      Wire.print(a);
      Wire.endTransmission();    // stop transmitting
      Serial.write("OK");
    }
    if (command.equals("m")) {
      Serial.println(splitter->getItemAtIndex(1));
      Wire.beginTransmission(4); // transmit to device #4
      Wire.print(a);
      Wire.endTransmission();    // stop transmitting
      Serial.write("OK");
    }
  }

}
