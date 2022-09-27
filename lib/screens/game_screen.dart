import 'package:connect_four/widgets/game_body.dart';
import 'package:flutter/material.dart';

//purpose is for navigation
class GameScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Connect Four"),
      ),
      body: Center(
        child: GameBody(),
      ),
    );
  }
}
