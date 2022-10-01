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
  static const Map<int, cellMode> decodePieceNumber = {
    0: cellMode.EMPTY,
    1: cellMode.RED,
    2: cellMode.YELLOW,
    3: cellMode.LIGHT_RED,
    4: cellMode.LIGHT_YELLOW,
  };

  List<Cell> _buildColumn() {
    return columnOfPieces.reversed
        .map((number) => Cell(mode: decodePieceNumber[number]!))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        controller.enterColumnHover(columnNumber);
      },
      onExit: (event) {
        controller.leaveColumnHover(columnNumber);
      },
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
