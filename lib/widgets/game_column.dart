import 'package:connect_four/controllers/game_controller.dart';
import 'package:flutter/material.dart';
import 'cell.dart';
import 'package:get/get.dart';

class GameColumn extends StatelessWidget {
  GameColumn({super.key, required this.columnOfPieces});

  final GameController controller = Get.find<GameController>();
  final List<int> columnOfPieces;

  List<Cell> _buildColumn() {
    return columnOfPieces.map((number) => Cell()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: _buildColumn());
  }
}
