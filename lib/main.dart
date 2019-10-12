import 'package:flutter/material.dart';
import 'package:netflix/pages/home_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff8844dd),
      ),
      home: HomeScreen(),
    );
  }
}
