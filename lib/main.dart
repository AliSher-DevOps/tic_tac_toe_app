import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/mainmenu.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic Tac Toe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
      //  brightness: Brightness.dark,

        primarySwatch: Colors.blue,
      ),
      home: MainMenu(),
    );
  }
}
