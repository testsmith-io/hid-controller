#include <Wire.h>
#include "Keyboard.h"

#if ARDUINO > 10605
#include <Mouse.h>
#endif  //ARDUINO > 10605
#include <MouseTo.h>

#include "StringSplitter.h"
String  wire_in;


// Default screenresolution: x= 3840  y= 2160
void setup() {
  Wire.begin(4);                // join i2c bus with address #4
  Wire.onReceive(receiveEvent); // register event
  Serial.begin(9600);  // initialize serial communication
  Keyboard.begin();
  Mouse.begin();

}

void loop () {
  if  (wire_in != "") {

    StringSplitter *splitter = new StringSplitter(wire_in, '|', 4);
    // Keyboard event
    if (splitter->getItemAtIndex(0).equals("k")) {
      Keyboard.print(splitter->getItemAtIndex(1));
    }
    // Mouse event
    if (splitter->getItemAtIndex(0).equals("m")) {
      if (splitter->getItemAtIndex(1).equals("move")) {
        MouseTo.setTarget(splitter->getItemAtIndex(2).toInt(), splitter->getItemAtIndex(3).toInt());
        while (MouseTo.move() == false) {}
        delay(2000);
      }
      else if (splitter->getItemAtIndex(1).equals("click")) {
        MouseTo.setTarget(splitter->getItemAtIndex(2).toInt(), splitter->getItemAtIndex(3).toInt());
        while (MouseTo.move() == false) {}
        delay(2000);
        Mouse.click();
      }
    }

    wire_in = "";
  }
}

void receiveEvent(int howMany)
{
  while (Wire.available() > 0) // loop through all but the last
  {
    char c = Wire.read(); // receive byte as a character
    wire_in.concat(c);
    delay(10);
  }
  delay(500);
}
