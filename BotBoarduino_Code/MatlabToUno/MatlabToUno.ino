#include <Wire.h>
#include <SoftwareSerial.h>
#include <Adafruit_Sensor.h>
#include <Adafruit_BNO055.h>
#include <utility/imumaths.h>

//Set up pins for virtual RX and TX serial lines
#define cSSC_OUT     12       //Output pin for (SSC32 RX) on BotBoarduino (Purple)
#define cSSC_IN      13       //Input pin for (SSC32 TX) on BotBoarduino (Blue)
SoftwareSerial mySerial(cSSC_IN,cSSC_OUT);

// Initialize variables
String command;

void setup() {
  // put your setup code here, to run once:
  Wire.begin();
  Serial.begin(38400);
  mySerial.begin(38400);
  
  //check serial communication - acknowledgement routine
  Serial.println('a');    //sending a character to PC

  char a = 'b';
  while(a != 'a')
  {
    //wait for a specific character from the PC
    a = Serial.read();
  }
  //Serial.println("Connect successfully!");
}

void loop() {
  // put your main code here, to run repeatedly:
  if(Serial.available() > 0)
  {
    command = Serial.readString();
    if(command == "R"){
      //output IMU data
      Serial.println("Print IMU data");
      Serial.println('A');
      
    }
    else
    {
      Serial.println(command);
      mySerial.println(command);
      delay(500);
    }
  }
}
