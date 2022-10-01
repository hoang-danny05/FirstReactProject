import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'coin.dart';

enum cellMode { EMPTY, YELLOW, RED, LIGHT_YELLOW, LIGHT_RED }

class Cell extends StatelessWidget {
  final cellMode mode;
  const Cell({super.key, required this.mode});

  Coin _buildCoin() {
    switch (mode) {
      case cellMode.YELLOW:
        return const Coin(pieceColor: Colors.yellow);
      case cellMode.RED:
        return const Coin(pieceColor: Colors.red);
      case cellMode.EMPTY:
        return const Coin(pieceColor: Colors.white);
      case cellMode.LIGHT_YELLOW:
        return Coin(pieceColor: Colors.yellow.shade200);
      case cellMode.LIGHT_RED:
        return Coin(pieceColor: Colors.red.shade200);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
        _buildCoin(),
      ],
    );
  }
}
