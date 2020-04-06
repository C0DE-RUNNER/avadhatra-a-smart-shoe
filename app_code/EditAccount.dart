import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditAccount extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new EditAccountState();
}

class EditAccountState extends State<EditAccount> {
  //final mainReference= FirebaseDatabase.instance.reference();
  final edAcController1 = TextEditingController();
  final edAcController2 = TextEditingController();
  final edAcController3 = TextEditingController();
  final CollectionReference accData =
      Firestore.instance.collection("account_info");
  static final formKey = GlobalKey<FormState>();

  submitAcc(String name, String mob, String email) {
    Map<String, String> data = <String, String>{
      "name": "$name",
      "mob": "$mob",
      "email": "$email"
    };
    accData.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Edit Account'),
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
                      padding: const EdgeInsets.all(20.0),
                      child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.only(top: 25.0)),
                            new TextFormField(
                              controller: edAcController1,
                              decoration: new InputDecoration(
                                labelText: "Name",
                              ),
                              keyboardType: TextInputType.text,
                              validator: (value){
                                if (value.isEmpty)
                                  return 'Please enter Name';
                              },
                            ),
                            Padding(padding: const EdgeInsets.only(top: 25.0)),
                            new TextFormField(
                              controller: edAcController2,
                              decoration: new InputDecoration(
                                labelText: "Mobile",
                              ),
                              keyboardType: TextInputType.number,
                              validator: (value){
                                if (value.isEmpty)
                                  return 'Please enter Mobile number';
                              },
                            ),
                            Padding(padding: const EdgeInsets.only(top: 25.0)),
                            new TextFormField(
                              controller: edAcController3,
                              decoration: InputDecoration(labelText: "Email"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value){
                                if (value.isEmpty)
                                  return 'Please enter Email';
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
                                  submitAcc(edAcController1.text,
                                      edAcController2.text, edAcController3.text);
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
