import 'package:flutter/material.dart';
import 'game_board.dart';

//purpose is to hold the main elements of the game.
//consists of cells, which may be empty, red, or yellow.
class GameBody extends StatelessWidget {
  const GameBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GameBoard();
  }
}
