//import 'dart:ffi';

import 'package:get/get.dart';

//board has 7 colums and 6 rows.
//may either be empty, yellow, or red.
//this class holds all game logic. Note how it stores all pertinent game data.
class GameController extends GetxController {
  RxList<List<int>> _board = RxList<List<int>>();
  List<List<int>> get board => _board.value;
  set board(List<List<int>> value) => _board.value = value;

  RxBool _turnRed = true.obs;
  bool get turnRed => _turnRed.value;

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

  //here lies the method that allows us to play the game
  void playColumn(int columnNumber) {
    final selectedColumn = board[columnNumber];
    if (selectedColumn.contains(0)) {
      final int rowIndex = selectedColumn.indexWhere((element) => element == 0);
      selectedColumn[rowIndex] = turnRed ? 1 : 2;
      _checkWin(colNumber: columnNumber, rowNumber: rowIndex);
      _turnRed.value = !_turnRed.value;
      update();
    }
  }

  _executeWin() {
    print("The winner is ${turnRed ? 'Red' : 'Yellow'}!");
    _buildBoard();
  }

  void _checkWin({required colNumber, required rowNumber}) {
    int currentColor = turnRed ? 1 : 2;
    //check horizontal wins
    _checkHorizontals(colNumber, rowNumber, currentColor);
    _checkVerticals(colNumber, rowNumber, currentColor);
  }

  void _checkVerticals(colNumber, rowNumber, currentColor) {
    if (rowNumber < 3) {
      return;
    }
    int longestVertical = 1;
    for (int i = rowNumber - 1; i >= 0; i--) {
      if (board[colNumber][i] == currentColor) {
        longestVertical++;
      } else {
        break;
      }
    }
    if (longestVertical >= 4) {
      _executeWin();
    }
  }

  void _checkHorizontals(colNumber, rowNumber, currentColor) {
    int longestHorizontal = 1;
    for (int i = colNumber + 1; i < 6; i++) {
      if (board[i][rowNumber] == currentColor) {
        longestHorizontal++;
      } else {
        break;
      }
    }
    for (int i = colNumber - 1; i >= 0; i--) {
      if (board[i][rowNumber] == currentColor) {
        longestHorizontal++;
      } else {
        break;
      }
    }
    if (longestHorizontal >= 4) {
      _executeWin();
    }
  }
}
