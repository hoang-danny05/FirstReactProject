import 'package:flutter/material.dart';

import 'coin.dart';

class Cell extends StatelessWidget {
  const Cell({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50,
          width: 50,
          color: Colors.blue,
        ),
        Coin(
          pieceColor: Colors.white,
        )
      ],
    );
  }
}
