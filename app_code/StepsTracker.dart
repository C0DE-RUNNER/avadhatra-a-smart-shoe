import 'package:flutter/material.dart';

class Steps extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new StepsState();
}

class StepsState extends State<Steps> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(tabs: [
              Tab(
                child: Text('Today'),
              ),
              Tab(
                child: Text('Week'),
              ),
              Tab(
                child: Text('Month'),
              ),
            ]),
            title: Text(
              'Steps Tracker',
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
          body: TabBarView(children: [
            Container(
                child: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: Image.asset('images/footsteps.jpg',
                        fit: BoxFit.fill, gaplessPlayback: true)),
                Text(
                  "Awaiting Data",
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                )
              ],
            ))),
            Container(
                child: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: Image.asset('images/footsteps.jpg',
                        fit: BoxFit.fill, gaplessPlayback: true)),
                Text(
                  "Awaiting Data",
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                )
              ],
            ))),
            Container(
                child: Center(
                    child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                    width: 150.0,
                    height: 150.0,
                    child: Image.asset('images/footsteps.jpg',
                        fit: BoxFit.fill, gaplessPlayback: true)),
                Text(
                  "Awaiting Data",
                  style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                )
              ],
            )))
          ]),
        ));
  }
}
