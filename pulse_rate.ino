#include<ESP8266WiFi.h>
#include <FirebaseArduino.h>\Z
#include <ESP8266HTTPClient.h>
#include <FirebaseCloudMessaging.h>
 
#define FIREBASE_HOST "fir-e0020.firebaseio.com"
#define FIREBASE_AUTH "11nXW0726KXdpcLo9JkvbrKowM7DdqrTF6PH66Q1"
#define WIFI_SSID "IllidanStormrage"
#define WIFI_PASSWORD "avinasha"
#define userToken ""
int UpperThreshold = 518;
int LowerThreshold = 490;
int reading = 0;
float BPM = 0.0;
bool IgnoreReading = false;
bool FirstPulseDetected = false;
unsigned long FirstPulseTime = 0;
unsigned long SecondPulseTime = 0;
unsigned long PulseInterval = 0;
const unsigned long delayTime = 10;
const unsigned long delayTime2 = 1000;
const unsigned long baudRate = 9600;
unsigned long previousMillis = 0;
unsigned long previousMillis2 = 0;

void setup(){
  Serial.begin(baudRate);
  pinMode(LED_BUILTIN, OUTPUT);
  digitalWrite(LED_BUILTIN, LOW);
  WiFi.begin(WIFI_SSID, WIFI_PASSWORD);
  Serial.print("connecting");
  while (WiFi.status() != WL_CONNECTED) {
  delay(500);
  }
  
  
  Firebase.begin(FIREBASE_HOST, FIREBASE_AUTH);
}

void loop(){


  unsigned long currentMillis = millis();
 if(myTimer1(delayTime, currentMillis) == 1){

    reading = analogRead(0); 

  
    if(reading > UpperThreshold && IgnoreReading == false){
      if(FirstPulseDetected == false){
        FirstPulseTime = millis();
        FirstPulseDetected = true;
      }
      else{
        SecondPulseTime = millis();
        PulseInterval = SecondPulseTime - FirstPulseTime;
        FirstPulseTime = SecondPulseTime;
      }
      IgnoreReading = true;
      digitalWrite(LED_BUILTIN, HIGH);
    }

    
    if(reading < LowerThreshold && IgnoreReading == true){
      IgnoreReading = false;
      digitalWrite(LED_BUILTIN, LOW);
    }  

    
    BPM = (1.0/PulseInterval) * 60.0 * 1000;
  }

  
  if(myTimer2(delayTime2, currentMillis) == 1){
    
    if(BPM>=50 && BPM<100)
    {
    Serial.print(BPM);
    Serial.println(" BPM");
     Firebase.setFloat(userToken"/Heartrate", BPM);
    Serial.flush();}
  }
}


int myTimer1(long delayTime, long currentMillis){
  if(currentMillis - previousMillis >= delayTime){previousMillis = currentMillis;return 1;}
  else{return 0;}
}


int myTimer2(long delayTime2, long currentMillis){
  if(currentMillis - previousMillis2 >= delayTime2){previousMillis2 = currentMillis;return 1;}
  else{return 0;}
}
