import 'package:connect_four/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'cell.dart';
import 'package:get/get.dart';

class GameColumn extends StatelessWidget {
  GameColumn(
      {super.key, required this.columnOfPieces, required this.columnNumber});

  final GameController controller = Get.find<GameController>();
  final List<int> columnOfPieces;
  final int columnNumber;

  List<Cell> _buildColumn() {
    return columnOfPieces.reversed
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
    return MouseRegion(
      cursor: controller.mouseMode(colNumber: columnNumber)
          ? SystemMouseCursors.click
          : SystemMouseCursors.forbidden,
      child: GestureDetector(
        onTap: () {
          controller.playColumn(columnNumber);
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _buildColumn(),
        ),
      ),
    );
  }
}
