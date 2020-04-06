import 'package:flutter/material.dart';
import 'package:wifi/wifi.dart';
import 'EditAccount.dart';
import 'EditBuddy.dart';
import 'Buddy.dart';
import 'Account.dart';
import 'Menu.dart';
import 'HomePage.dart';
import 'PulseRate.dart';
import 'StepsTracker.dart';
void main() => runApp(Avadhatra());

class Avadhatra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Avadhatra',
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        "/EditBuddy": (BuildContext context) => new EditBuddy(),
        "/EditAccount": (BuildContext context) => new EditAccount(),
        "/Buddy": (BuildContext context) => new Buddy(),
        "/Account": (BuildContext context) => new Account(),
        "/Menu": (BuildContext context) => new Menu(),
        "/HomePage": (BuildContext context) => new HomePage(),
        "/PulseRate": (BuildContext context) => new PulseRate(),
        "/Steps": (BuildContext context) => new Steps(),
      },
    );
  }
}
