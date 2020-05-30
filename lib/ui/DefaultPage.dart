import 'package:flutter/material.dart';
class DefaultPage extends StatefulWidget {
  @override
  DefaultPageState createState() => DefaultPageState();
}
class DefaultPageState extends State<DefaultPage> {

  @override
  Widget build(BuildContext context) {

    Future.microtask((){
      Navigator.of(context).pushNamed("/Login");
    });
    return Scaffold();
  }
}
