import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'PulseModel.dart';
class PulseRate extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new PulseRateState();
}

class PulseRateState extends State<PulseRate> {

  Future <List<PulseModel>> getData() async{
    List<PulseModel> pulse=[];
    await Firestore.instance.collection('pulse_daily').getDocuments().then((QuerySnapshot snapshot){
      snapshot.documents.forEach((s){
        pulse.add(PulseModel.fromJson(s.data));
      });
    });
    return pulse;
  }
  Widget getBody(List<PulseModel> pulse){
    return TabBarView(children: [
      Container(
          child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                      width: 150.0,
                      height: 150.0,
                      child: Icon(
                        Icons.favorite_border,
                        size: 120.0,
                      )),
                  Text(
                    pulse[pulse.length-1].BPM,  // This is to get the most recent value of the BPM from the database.
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
                      child: Icon(
                        Icons.favorite_border,
                        size: 120.0,
                      )),
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
                      child: Icon(
                        Icons.favorite_border,
                        size: 120.0,
                      )),
                  Text(
                    "Awaiting Data",
                    style: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
                  )
                ],
              )))
    ]);
  }

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
              'Pulse Rate Tracker',
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
          body: FutureBuilder(
              future: getData(),
              builder: (context,snap){
                if(snap.hasData){
                  return getBody(snap.data);
                }else{
                  return Center(
                    child: CircularProgressIndicator(backgroundColor: Colors.teal,),
                  );
                }
              }),
        ));
  }
}
