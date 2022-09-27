import 'package:flutter/material.dart';

class Coin extends StatelessWidget {
  final Color pieceColor;
  const Coin({super.key, required this.pieceColor});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35), color: pieceColor),
        ),
      ),
    );
  }
}
