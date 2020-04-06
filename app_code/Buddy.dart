import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:avadhatra/BuddyModel.dart';
class Buddy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BuddyState();
}

class BuddyState extends State<Buddy> {
  Future <List<BuddyModel>> getData() async{
    List<BuddyModel> buddies1=[];
    await Firestore.instance.collection('buddy_1').getDocuments().then((QuerySnapshot snapshot){
      snapshot.documents.forEach((s){
        buddies1.add(BuddyModel.fromJson(s.data));
      });
    });
    return buddies1;
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Buddies'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          new IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.of(context).pushNamed("/EditBuddy");
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: getData(),
          builder:(context,snap){
            if(snap.hasData){
              return getBody(snap.data);
            }else{
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }
      )
    );
  }
  Widget getBody(List<BuddyModel> buddies){
    return ListView(
      children: <Widget>[
        ListTile(
          contentPadding: EdgeInsets.only(top: 28.0, left: 10.0),
          leading: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
          ),
          title: Text(
            'Buddy-1',
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 10.0),
          leading: Icon(Icons.account_circle),
          title: Text(
            buddies[buddies.length-1].name1,
            style: TextStyle(fontSize: 20.0, color: Colors.teal),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 10.0),
          leading: Icon(Icons.call),
          title: Text(
            buddies[buddies.length-1].mob1,
            style: TextStyle(fontSize: 20.0, color: Colors.teal),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.0),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(top: 28.0, left: 10.0),
          leading: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.black,
          ),
          title: Text(
            'Buddy-2',
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 10.0),
          leading: Icon(Icons.account_circle),
          title: Text(
            buddies[buddies.length-1].name2,
            style: TextStyle(fontSize: 20.0, color: Colors.teal),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 10.0),
          leading: Icon(Icons.call),
          title: Text(
            buddies[buddies.length-1].mob2,
            style: TextStyle(fontSize: 20.0, color: Colors.teal),
          ),
        ),
      ],
    );
  }
}
