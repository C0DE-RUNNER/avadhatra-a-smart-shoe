import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditBuddy extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EditBuddyState();
}

class EditBuddyState extends State<EditBuddy> {
  final buddyName1 = TextEditingController();
  final buddyName2 = TextEditingController();
  final buddyMob1 = TextEditingController();
  final buddyMob2 = TextEditingController();
  final CollectionReference buddyData1 =
      Firestore.instance.collection("buddy_1");

  submitData(String name1, String mob1, String name2, String mob2) {
    Map<String, String> bud1 = <String, String>{
      "name1": "$name1",
      "mob1": "$mob1",
      "name2": "$name2",
      "mob2": "$mob2",
    };
    buddyData1.add(bud1);
  }

  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Edit Buddies'),
          backgroundColor: Colors.black,
        ),
        body: ListView(
          children: <Widget>[
            ListTile(
              title: new Form(
                  key: formKey,
                  child: new Theme(
                    data: new ThemeData(
                        primarySwatch: Colors.teal,
                        inputDecorationTheme: new InputDecorationTheme(
                            labelStyle: new TextStyle(
                                color: Colors.teal, fontSize: 20.0))),
                    child: new Container(
                      padding: const EdgeInsets.all(10.0),
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.only(top: 25.0)),
                            new TextFormField(
                              decoration: new InputDecoration(
                                labelText: "Buddy-1 Name",
                              ),
                              controller: buddyName1,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) return 'Please enter Name';
                              },
                            ),
                            Padding(padding: const EdgeInsets.only(top: 25.0)),
                            new TextFormField(
                              controller: buddyMob1,
                              decoration: new InputDecoration(
                                labelText: "Buddy-1 Mobile",
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Please enter Mobile Number';
                              },
                            ),
                            Padding(padding: const EdgeInsets.only(top: 90.0)),
                            new TextFormField(
                              controller: buddyName2,
                              decoration:
                                  InputDecoration(labelText: "Buddy-2 Name"),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) return 'Please enter Name';
                              },
                            ),
                            Padding(padding: const EdgeInsets.only(top: 25.0)),
                            TextFormField(
                              controller: buddyMob2,
                              decoration:
                                  InputDecoration(labelText: "Buddy-2 Mobile"),
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value.isEmpty)
                                  return 'Please enter Mobile Number';
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0),
                            ),
                            new MaterialButton(
                              height: 40.0,
                              minWidth: 100.0,
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: new Text("Submit"),
                              onPressed: () {
                                if (formKey.currentState.validate()) {
                                  submitData(buddyName1.text, buddyMob1.text,
                                      buddyName2.text, buddyMob2.text);
                                  Navigator.pop(context);
                                }

                              },
                              splashColor: Colors.white,
                            )
                          ]),
                    ),
                  )),
            )
          ],
        ));
  }
}
