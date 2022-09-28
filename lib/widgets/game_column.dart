import 'package:connect_four/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'cell.dart';
import 'package:get/get.dart';

class GameColumn extends StatelessWidget {
  GameColumn({super.key, required this.columnOfPieces});

  final GameController controller = Get.find<GameController>();
  final List<int> columnOfPieces;

  List<Cell> _buildColumn() {
    return columnOfPieces
        .map((number) => number == 0
            ? const Cell(
                mode: cellMode.EMPTY,
              )
            : number == 1
                ? const Cell(mode: cellMode.RED)
                : const Cell(
                    mode: cellMode.YELLOW,
                  ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: _buildColumn());
  }
}
