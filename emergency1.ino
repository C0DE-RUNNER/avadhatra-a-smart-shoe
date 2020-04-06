#include<Wire.h>
#include <Firebase.h>
#include <FirebaseArduino.h>
#include <ESP8266WiFi.h>
#define FIREBASE_HOST "trying-3367b.firebaseio.com"
#define FIREBASE_AUTH "kOU9rjlNNBRMu72dGoPSkBPeB49xqSyRfX0rXSfT"
#define WIFI_SSID "IllidanStormrage"
#define WIFI_PASSWORD "avinasha"
#define userToken ""
unsigned long startTime = millis ();
unsigned long interval = 3000;
const int MPU=0x68; 
int16_t AcX,AcY,AcZ,Tmp,GyX,GyY,GyZ,length,stepcount; 
void setup() {
  Serial.begin(9600);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(500);
  }
  Serial.println();
  Serial.print("connected: ");
  Serial.println(WiFi.localIP());
  Wire.begin();
  Wire.beginTransmission(MPU);
  Wire.write(0x6B); 
  Wire.write(0);    
  Wire.endTransmission(true);
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}


void loop(){
  Wire.beginTransmission(MPU);
  Wire.write(0x3B);  
  Wire.endTransmission(false);
  Wire.requestFrom(MPU,12,true);  
  AcX=Wire.read()<<8|Wire.read();    
  AcY=Wire.read()<<8|Wire.read();  
  AcZ=Wire.read()<<8|Wire.read();  
  GyX=Wire.read()<<8|Wire.read();  
  GyY=Wire.read()<<8|Wire.read();  
  GyZ=Wire.read()<<8|Wire.read();  
  
  Serial.print("Accelerometer: ");
  Serial.print("X = "); Serial.print(AcX);
  Serial.print(" | Y = "); Serial.print(AcY);
  Serial.print(" | Z = "); Serial.println(AcZ); 
  
  Serial.print("Gyroscope: ");
  Serial.print("X = "); Serial.print(GyX);
  Serial.print(" | Y = "); Serial.print(GyY);
  Serial.print(" | Z = "); Serial.println(GyZ);
  Serial.println(" ");
  delay(1000);
     if(AcX>=20000 || AcX<=-20000){
      if(AcX<=-20000){
        AcX=-(AcX);    
      }
      Serial.println("Emergency");
      delay(1000); 
      Firebase.setFloat(userToken"/Acceleration Emergency", AcX);
  }

}
