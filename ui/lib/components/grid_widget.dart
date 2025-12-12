import 'package:flutter/material.dart';
import 'package:minesweeper/components/cell_widget.dart';
import 'ffi.dart';
import 'grid.dart';

class MinesweeperGridWidget extends StatefulWidget {
  final int rows;
  final int cols;
  final int mines;

  const MinesweeperGridWidget({
    super.key,
    required this.rows,
    required this.cols,
    required this.mines,
  });

  @override
  State<MinesweeperGridWidget> createState() => _MinesweeperGridWidgetState();
}

class _MinesweeperGridWidgetState extends State<MinesweeperGridWidget> {
  late MinesweeperFFI ffi;
  late MinesweeperGrid grid;

  @override
  void initState() {
    super.initState();
    ffi = MinesweeperFFI();
    grid = MinesweeperGrid(
      ffi: ffi,
      rows: widget.rows,
      cols: widget.cols,
      mines: widget.mines,
      seed: DateTime.now().millisecondsSinceEpoch,
    );
  }

  @override
  void dispose() {
    grid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      
      children: grid.grid.map<Widget>((rowCells) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: rowCells.map<Widget>((cell) {
            return MinesweeperCellWidget(
              row: cell.row,
              col: cell.col,
              isRevealed: cell.isRevealed,
              isMine: cell.isMine,
              isFlagged: cell.isFlagged,
              adjacentMines: cell.adjacentMines,
              onReveal: () {
                setState(() => grid.revealCell(cell.row, cell.col));
              },
              onFlag: () {
                setState(() => grid.toggleFlag(cell.row, cell.col));
              },
            );
          }).toList(),
        );
      }).toList(),
    );
  }
}
