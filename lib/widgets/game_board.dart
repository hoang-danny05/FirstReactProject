import 'package:connect_four/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'game_column.dart';

class GameBoard extends StatelessWidget {
  GameBoard({super.key});

  final GameController controller = Get.find<GameController>();
  //just like in unity

  List<GameColumn> _buildBoard() {
    return controller.board
        .map((column) => GameColumn(
              columnOfPieces: column,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(mainAxisSize: MainAxisSize.min, children: _buildBoard()),
        ],
      ),
    );
  }
}
