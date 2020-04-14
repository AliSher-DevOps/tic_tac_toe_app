import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/screens/home.dart';
class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainMenuState();
  }
}
class  MainMenuState extends State<MainMenu>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        appBar: AppBar(
        title: Text("Tic Tac Toe"),
    ),
    body :Container(
      margin: EdgeInsets.all(58.0),
      child: ListView(
        children: <Widget>[

          Padding(
              padding: EdgeInsets.only(top: 25.0, bottom: 80.0),
              child: Text(
               "Tic Tac Toe",style:
                TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold
                  ,

                ),
                textAlign: TextAlign.center,
              )),
          Row(

            children: <Widget>[

              Expanded(
                child: RaisedButton(
                  child: Text("Play 1 v 1"),
                  color: Colors.cyan,
                  onPressed: () {
                    NavigateToDetails();
                  },
                ),
              ),

            ],
          ),

          Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  child: Text("Exit"),
                  color: Colors.pink,
                  onPressed: (

                      ) {
                    exit(0);
                  },
                ),
              ),

            ],
          )
        ],
      ),
    ),


    );
  }

  void NavigateToDetails() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }
}
