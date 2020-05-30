import 'package:flutter/material.dart';
import 'configs/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var VisualDensity;
    return MaterialApp(
      title: 'Flutter API',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: routesMap,
    );
  }
}
