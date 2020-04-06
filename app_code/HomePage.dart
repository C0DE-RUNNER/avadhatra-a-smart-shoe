import 'package:flutter/material.dart';
//import 'package:sms/sms.dart';
import 'package:location/location.dart';
class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        title: Text(
          "Home",
          style: TextStyle(fontSize: 23.0),
        ),
        backgroundColor: Colors.black,
        actions: <Widget>[
          new IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                Navigator.of(context).pushNamed("/Menu");
              })
        ],
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 150.0,
                height: 150.0,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/PulseRate");
                  },
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(70.0)),
                  splashColor: Colors.teal,
                  child: Icon(
                    Icons.favorite_border,
                    size: 120.0,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                "Pulse rate.",
                style: TextStyle(fontSize: 23.0),
              ),
              Padding(
                padding: EdgeInsets.only(top: 60.0),
              ),
              SizedBox(
                width: 175.0,
                height: 165.0,
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/Steps");
                    },
                    color: Colors.transparent,
                    splashColor: Colors.teal,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    child: ConstrainedBox(
                      constraints: new BoxConstraints.expand(),
                      child: Image.asset('images/footsteps.jpg',
                          fit: BoxFit.fill, gaplessPlayback: true),
                    )),
              ),
              Text(
                "Steps",
                style: TextStyle(fontSize: 23.0),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Text(
            "SOS",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
          onPressed: () async {
            var currentLocation = <String,double>{};
            var location = Location();
              currentLocation = await location.getLocation();
              final latitude = currentLocation["latitude"];
              final longitude = currentLocation["longitude"];
              //print(currentLocation);
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("The Location of the user is $latitude(Latitude),$longitude(Longitude)"),
                    );
                  }
              );
            }
          ),
    );
  }
}
