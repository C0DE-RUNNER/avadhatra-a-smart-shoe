import 'package:flutter/material.dart';
import './home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.black),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child:

                 Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      MaterialButton(

                        height: 140.0,
                        minWidth: 300.0,
                        color: Colors.black,
                        textColor: Colors.teal,

                        child: Text("AVADHATRA",style: TextStyle(fontSize: 28.0),),
                        onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context)
                              => HomePage("")));
                        },
                      )
                    ],
                  ),

                ),
              )
            ],
          )
        ],
      ),

    );
  }
}
