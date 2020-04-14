import 'package:flutter/material.dart';

class CustomDailoge extends StatelessWidget{
  final title;
  final content;
  final actionText;
  final VoidCallback callback;

  CustomDailoge( this.title, this.content,  this.callback,[this.actionText="Play Again"]);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  AlertDialog(
      title:Text(title),
      content:Text(content),
      actions: <Widget>[
        FlatButton(
            onPressed: callback,
            color: Colors.white,
            child: Text(actionText)
        ),

      ],

    );
  }

}