import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_app/screens/gamebuttons.dart';
import 'package:tic_tac_toe_app/screens/dialoge.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }
}

class HomeState extends State<Home> {
  List<GameButtons> buttonList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonList = doinit();
  }

  List<GameButtons> doinit() {
    player1 = List();
    player2 = List();
    activePlayer = 1;
    var gamebuttons = <GameButtons>[
      GameButtons(id: 1),
      GameButtons(id: 2),
      GameButtons(id: 3),
      GameButtons(id: 4),
      GameButtons(id: 5),
      GameButtons(id: 6),
      GameButtons(id: 7),
      GameButtons(id: 8),
      GameButtons(id: 9),
    ];
    return gamebuttons;
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    } else if (player1.contains(4) &&
        player1.contains(5) &&
        player1.contains(6)) {
      winner = 1;
    } else if (player1.contains(7) &&
        player1.contains(8) &&
        player1.contains(9)) {
      winner = 1;
    } else if (player1.contains(1) &&
        player1.contains(4) &&
        player1.contains(7)) {
      winner = 1;
    } else if (player1.contains(2) &&
        player1.contains(5) &&
        player1.contains(8)) {
      winner = 1;
    } else if (player1.contains(3) &&
        player1.contains(6) &&
        player1.contains(9)) {
      winner = 1;
    } else if (player1.contains(1) &&
        player1.contains(5) &&
        player1.contains(9)) {
      winner = 1;
    } else if (player1.contains(3) &&
        player1.contains(5) &&
        player1.contains(7)) {
      winner = 1;
    } else if (player2.contains(1) &&
        player2.contains(2) &&
        player2.contains(3)) {
      winner = 2;
    } else if (player2.contains(4) &&
        player2.contains(5) &&
        player2.contains(6)) {
      winner = 2;
    } else if (player2.contains(7) &&
        player2.contains(8) &&
        player2.contains(9)) {
      winner = 2;
    } else if (player2.contains(1) &&
        player2.contains(4) &&
        player2.contains(7)) {
      winner = 2;
    } else if (player2.contains(2) &&
        player2.contains(5) &&
        player2.contains(8)) {
      winner = 2;
    } else if (player2.contains(3) &&
        player2.contains(6) &&
        player2.contains(9)) {
      winner = 2;
    } else if (player2.contains(1) &&
        player2.contains(5) &&
        player2.contains(9)) {
      winner = 2;
    } else if (player2.contains(3) &&
        player2.contains(5) &&
        player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => new CustomDailoge("PLayer 1 Won ",
                "Press the play Button to play Again", playAgain));
      } else {
        showDialog(
            context: context,
            builder: (_) => new CustomDailoge("Computer Won ",
                "Press the play Button to play Again", playAgain));
      }
    }
    return winner;
  }

  void playgame(GameButtons gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = 'X';
        gb.bg = Colors.pink;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = '0';
        gb.bg = Colors.blueAccent;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enable = false;
      int winner = checkWinner();

      if (winner == -1) {
        if (buttonList.every((p) => p.text != "")) {
          //check every btn is blank or not
          showDialog(
              context: context,
              builder: (_) =>
                  CustomDailoge("Game tited", "Press the play Button to play Again", playAgain));

        }
        else{
          activePlayer==2?autoplay():null;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.only(top: 80.0 ,right: 20.0,left: 20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: 9.0,
                    mainAxisSpacing: 9.0,
                  ),
                  itemCount: buttonList.length,
                  itemBuilder: (context, index) => new SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: RaisedButton(
                          padding: EdgeInsets.all(8.0),
                          onPressed: buttonList[index].enable
                              ? () => playgame(buttonList[index])
                              : null,
                          child: Text(
                            buttonList[index].text,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          color: buttonList[index].bg,
                          disabledColor: buttonList[index].bg,
                        ),
                      )),
            ),
            RaisedButton(
              child: Text(
                "Reset",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                ),
              ),
              color: Colors.cyan,
              padding: const EdgeInsets.all(12.0),
              onPressed: reset,
            )
          ],
        ));
  }

  void playAgain() {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
    setState(() {
      buttonList = doinit();
    });
  }
  void reset() {
    setState(() {
      buttonList = doinit();
    });
  }
 void autoplay() {
    var emptyCells = List();
    var list =List.generate(9, (index)=>index+1);
    for( var cellID in list){
      if(!(player1.contains(cellID) || player2.contains(cellID))){
        emptyCells.add(cellID);
      }
    }
    var r = Random();
    var randomIndex =r.nextInt(emptyCells.length-1);
    var cellID =emptyCells[randomIndex];
    int index=buttonList.indexWhere((index)=> index.id == cellID);
    playgame(buttonList[index]);
 }
}
