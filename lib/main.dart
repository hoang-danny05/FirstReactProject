import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const ConnectFourGame(),
    );
  }
}

class ConnectFourGame extends StatelessWidget {
  const ConnectFourGame({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Padding(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 6,
          right: MediaQuery.of(context).size.width / 6,
        ),
        child: Column(
          children: const [
            TurnText(),
            GameBoard(),
          ],
        ),
      )),
    );
  }
}

class TurnText extends StatefulWidget {
  const TurnText({super.key});

  @override
  State<StatefulWidget> createState() => _TurnTextState();
}

class _TurnTextState extends State<TurnText> {
  String text = "red's turn";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Text(text),
    );
  }
}

class GameBoard extends StatefulWidget {
  const GameBoard({super.key});

  @override
  State<StatefulWidget> createState() => _GameBoardState();
}

class _GameBoardState extends State<GameBoard> {
  List<List<GamePiece>> places = [
    [const GamePiece.empty(), const GamePiece.empty(), const GamePiece.empty()],
    [const GamePiece.empty(), const GamePiece.empty(), const GamePiece.empty()],
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).size.height / 4,
        left: MediaQuery.of(context).size.width / 3,
        right: MediaQuery.of(context).size.width / 3,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(width: 5),
          bottom: BorderSide(width: 5),
          left: BorderSide(width: 10),
          right: BorderSide(width: 10),
        ),
      ),
      //Main structure of the game board
      child: Row(
        children: [
          Column(
            children: [
              places[0][0],
              places[0][1],
              places[0][2],
            ],
          ),
          Column(
            children: [
              places[1][0],
              places[1][1],
              places[1][2],
            ],
          ),
        ],
      ),
    );
  }
}

class GamePiece extends StatelessWidget {
  final Color _pieceColor;
  const GamePiece.empty({super.key, Color c = Colors.white}) : _pieceColor = c;
  const GamePiece.filled({super.key, Color c = Colors.black}) : _pieceColor = c;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: _pieceColor,
        borderRadius: BorderRadius.circular(25),
        //more than 50% of width makes circle
        border: const Border(
          top: BorderSide(color: Colors.black, width: 10),
        ),
      ),
    );
  }
}
