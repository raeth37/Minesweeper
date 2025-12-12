import 'dart:ffi';
import 'ffi.dart';

class MinesweeperCell {
  final int row;
  final int col;

  bool isMine;
  bool isRevealed;
  bool isFlagged;
  int adjacentMines;

  MinesweeperCell({
    required this.row,
    required this.col,
    this.isMine = false,
    this.isRevealed = false,
    this.isFlagged = false,
    this.adjacentMines = 0,
  });
}

class MinesweeperGrid {
  final int rows;
  final int cols;
  final int mines;
  final MinesweeperFFI ffi;

  late Pointer<Void> game;

  late List<List<MinesweeperCell>> grid;

  MinesweeperGrid({
    required this.ffi,
    required this.rows,
    required this.cols,
    required this.mines,
    required int seed,
  }) {
    game = ffi.newGame(rows, cols, mines, seed);

    grid = List.generate(rows, (r) {
      return List.generate(cols, (c) {
        return MinesweeperCell(row: r, col: c);
      });
    });

    refreshBoard();
  }

  void dispose() {
    ffi.freeGame(game);
  }

  void refreshBoard() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        final cell = grid[r][c];

        cell.isMine = ffi.isMine(game, r, c).value != 0;
        cell.isRevealed = ffi.isRevealed(game, r, c).value != 0;
        cell.isFlagged = ffi.isFlagged(game, r, c).value != 0;
        cell.adjacentMines = ffi.adjacent(game, r, c);
      }
    }
  }

  void revealCell(int row, int col) {
    ffi.leftClick(game, row, col);
    refreshBoard();
  }

  void toggleFlag(int row, int col) {
    ffi.rightClick(game, row, col);
    refreshBoard();
  }
}

extension on bool {
  get value => null;
}
