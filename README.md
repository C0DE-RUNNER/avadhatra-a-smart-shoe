# avadhatra
Our shoe project.

The files uploaded in the repo are only the codes written by us (library implementation also included). The imports are at the top of the code in each file. However, the installation of the libraries such as pubspec.yaml file etc. are not shown. The repo also does not include any kind of build files. Only the code written has been submitted for evaluation.

# Files Description
1. The App's files are placed in app_data folder.
2. The arduino code is found in the repository itself.
3. The app is built on flutter SDK. The code execution starts from main.dart. The Splash screen will be the first page the user experience.
4. Many Routes from the HomePage are created that can be found in the main.dart file.
5. Main page has an SoS button at the bottom end as a floatingActionButton, that is used to get the location of the device, right now it shows only the location as an alertDialog.
6. Buddy and Account information with forms and new routes were added. Here the account info is about the person using the shoe, and the buddies refer to the emergency contacts of the users, to which the SMS text will be sent(Alert Message).
- HomePage.dart : Implies the basic GUI and the SoS button(To find the location of the device and to display it on the screen)
- PulseRate.dart: Shows the pulse count average and other calculations based on pulse rate
- StepTracker.dart: Shows the number of steps taken by the user wearing the shoe
- Buddy.dart: Keeps record of the emergency contacts to whom the alert messages will be sent.
- Account.dart: Keeps record of the user's data.

# Dependencies

HARDWARE:
• Arduino-uno
• Pulse rate sensor
• Accelerometer sensor(GY-521)
• Wifi module(ESP-8266/NODE-MCU)

SOFTWARE:
• Firebase
  -Cloud Firestore
  -Realtime DB
• Flutter
  - location
  - simple_permissions
  - firebase plugins

# Functions
1. The pulse Rate sensor interfaced with arduino is keeping a track of the pulse rate of the user and the data is sent to the firebase through Wifi.
2. The accelerometer is counting the number of steps and sending the data to the firebase through Wifi.
3. The collected data is stored in the firebase cloud and is regularly displayed on the App.
4. In case of emergency a security alert message will be sent to the buddy contacts provided by the user along with the current location.
5. Updating the forms is done by adding a 'TextEditingController' widget in each TextFormField and using it to push into the firestore data base.
6. The account and buddies information is pulled from the firestore data in the 'Account.dart' and 'Buddy.dart' file using futures and async blocks.
7. The Location of the Device is tracked by the 'location' library in the dart packages. The location fetching is triggered through the 'SoS' button for demonstartion purposes.('HomePage.dart', 'FloatingButton'). 
8. The pulse-rate fetched from the database is displayed in the PulseRate.dart file using the same kind of futures and async blocks that are implemented for 'Buddy.dart' and 'Account.dart'. Same is for Step count in 'Steptracker.dart'.


# ScreenShots
1. ![splashScreen](/Screenshot_2019-01-24-08-00-34-786_com.avadhatra.avadhatra.png)
2. ![img](/Screenshot_2019-01-24-08-00-39-074_com.avadhatra.avadhatra.png)
3. ![img](/Screenshot_2019-01-24-08-00-44-594_com.avadhatra.avadhatra.png)
4. ![img](/Screenshot_2019-01-24-08-00-49-211_com.avadhatra.avadhatra.png)
5. ![img](/Screenshot_2019-01-24-08-01-02-113_com.avadhatra.avadhatra.png)
6. ![img](/Screenshot_2019-01-24-08-01-10-125_com.avadhatra.avadhatra.png)
7. ![img](/Screenshot_2019-01-24-08-01-16-793_com.avadhatra.avadhatra.png)
