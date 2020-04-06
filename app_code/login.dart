import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        padding: EdgeInsets.all(25.0),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Email';
                    }
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter Password';
                    }
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                ),
                RaisedButton(
                    color: Colors.blue,
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      if (formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing Data')));
                      }
                    })
              ],
            )),
      ),
    );
  }
}
