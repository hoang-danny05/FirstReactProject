import 'package:flutter/material.dart';
import 'cell.dart';

class GameColumn extends StatelessWidget {
  const GameColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisSize: MainAxisSize.min, children: [
      Cell(),
      Cell(),
      Cell(),
      Cell(),
      Cell(),
      Cell(),
    ]);
  }
}
