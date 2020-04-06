import 'package:avadhatra/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  //FirebaseApp app;
  //CollectionReference ref;
  @override
  State<StatefulWidget> createState() => new AccountState();

  //Account() {
    //configure();
 // }
/*Future<void> configure() async
  {
    app = await FirebaseApp.configure(name: 'xyz',options: FirebaseOptions(googleAppID: '1:974909939212:android:1d4e30b6bb97465a',databaseURL: 'https://trying-3367b.firebaseio.com'));
    ref = Firestore(app: app).collection('account_info');
  }*/
}

class AccountState extends State<Account> {
  Future<List<UserModel>> getData() async {
    List<UserModel> users = [];
    await Firestore.instance.collection('account_info').getDocuments().then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((s) {
        users.add(UserModel.fromJson(s.data));
      });
      //print('DATA ::: ${snapshot.documents[1].data}');
    });
    return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Account'),
          backgroundColor: Colors.black,
          actions: <Widget>[
            new IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed("/EditAccount");
              },
            )
          ],
        ),
        body: FutureBuilder(
            future: getData(),
            builder: (ctx, snap) {
              //if (snap.hasError) print('ERRROOOORRR : ${snap.error}');
              //print('Sommmm : ${snap.data}');
              if (snap.hasData) {
                return getBody(snap.data);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Widget getBody(List<UserModel> users) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.account_circle),
          contentPadding: EdgeInsets.only(left: 10.0, top: 28.0),
          title: Text(
            'Name',
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 10.0),
          leading: Icon(Icons.arrow_right),
          title: Text(
            users[users.length-1].name,
            style: TextStyle(fontSize: 20.0, color: Colors.teal),
          ),
        ),
        ListTile(
          leading: Icon(Icons.call),
          contentPadding: EdgeInsets.only(left: 10.0, top: 28.0),
          title: Text(
            'Mobile',
            style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 10.0),
          leading: Icon(Icons.arrow_right),
          title: Text(
            users[users.length -1].mob,
            style: TextStyle(fontSize: 20.0, color: Colors.teal),
          ),
        ),
        ListTile(
          leading: Icon(Icons.email),
          contentPadding: EdgeInsets.only(left: 10.0, top: 28.0),
          title: Text(
            'Email',
            style: TextStyle(
              fontSize: 23.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.only(left: 10.0),
          leading: Icon(Icons.arrow_right),
          title: Text(
            users[users.length-1].email,
            style: TextStyle(fontSize: 20.0, color: Colors.teal),
          ),
        ),
      ],
    );
  }
}
