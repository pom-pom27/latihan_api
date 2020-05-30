import 'package:flutter/material.dart';
class LoginIndexPage extends StatefulWidget {

  @override
  LoginIndexPageState createState() => LoginIndexPageState();
}
class LoginIndexPageState extends State<LoginIndexPage> {
  final _formKey = GlobalKey<FormState>();
  var usernameCtrl = TextEditingController();
  var passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(20.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            children: <Widget>[
              new TextFormField(
                controller: usernameCtrl, 
                keyboardType: TextInputType.text,
                decoration: new InputDecoration(
                  labelText: 'Username'
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Mohon input Username';
                  }
                  return null;
                },
              ),
              new TextFormField(
                controller: passwordCtrl,
                keyboardType: TextInputType.visiblePassword, 
                obscureText: true, 
                decoration: new InputDecoration(
                  labelText: 'Password'
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Mohon input Password';
                  }
                  return null;
                },
              ),
              new Container(
                child: new RaisedButton(
                  child: new Text(
                    'Login',

                    style: new TextStyle(color: Colors.white),

                  ),
                  onPressed: (){
                    if (_formKey.currentState.validate()) {
                      Navigator.of(context).pushNamed("/Home");
                    }
                  },
                  color: Colors.blue,
                ),
                margin: new EdgeInsets.only(top: 20.0),
              )
            ],
          ),
        ),
      )
    );
  }
}