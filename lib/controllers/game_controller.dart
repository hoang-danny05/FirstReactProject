import 'dart:ffi';

import 'package:get/get.dart';

class GameController extends GetxController {
  //board has 7 colums and 6 rows.
  //may either be empty, yellow, or red.
  RxList<List<int>> _board = RxList<List<int>>();
  List<List<int>> get board => _board.value;
  set board(List<List<int>> value) => _board.value = value;

  void _buildBoard() {
    //creates model of entire board at the beginning, with zeros representing empty spaces
    board = [
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
      List.filled(6, 0),
    ];
  }

  @override
  void onInit() {
    _buildBoard();
  }
}
