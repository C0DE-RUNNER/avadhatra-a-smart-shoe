import 'package:flutter/material.dart';
class Menu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => new MenuState();
}
class MenuState extends State<Menu>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Menu',style: TextStyle(
          fontSize: 28.0,
        ),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(

        children: <Widget>[
          Padding(padding: EdgeInsets.only(top:50.0)),
          ListTile(
            contentPadding: EdgeInsets.only(left:28.0,top:28.0,right: 10.0),
            leading: Icon(Icons.account_box),
            title: Text(
              'Account',
              style:TextStyle(
                  fontSize: 23.0,
              ),),trailing: Icon(Icons.navigate_next,color:Colors.black),
            onTap: () {Navigator.of(context).pushNamed("/Account");},
          ),
          Padding(padding: EdgeInsets.only(top:50.0)),
          ListTile(
            contentPadding: EdgeInsets.only(left:28.0,top:28.0,right: 10.0),
            leading:Icon(Icons.radio_button_unchecked),
            title: Text(
              'Avadhatra Security Buddies',
              style:TextStyle(
                fontSize: 23.0,
              ),),trailing: Icon(Icons.navigate_next,color: Colors.black,),
            onTap: () {Navigator.of(context).pushNamed("/Buddy");},
          ),
        ],
      ),
    );

  }
}