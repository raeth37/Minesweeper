import 'package:flutter/material.dart';

class MinesweeperCellWidget extends StatelessWidget {
  final int row;
  final int col;
  final bool isRevealed;
  final bool isMine;
  final bool isFlagged;
  final int adjacentMines;
  final VoidCallback onReveal;
  final VoidCallback onFlag;

  const MinesweeperCellWidget({
    super.key,
    required this.row,
    required this.col,
    required this.isRevealed,
    required this.isMine,
    required this.isFlagged,
    required this.adjacentMines,
    required this.onReveal,
    required this.onFlag,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onReveal,
      onLongPress: onFlag,

      child: Container(
        width: 32,
        height: 32,
        margin: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          color: isRevealed ? Colors.grey[300] : Colors.grey[500],
          border: Border.all(color: Colors.black),
        ),
        
        alignment: Alignment.center,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    if (isFlagged) return const Icon(Icons.flag, color: Colors.red, size: 18);
    if (!isRevealed) return const SizedBox.shrink();
    if (isMine) return const Icon(Icons.brightness_1, color: Colors.black, size: 18);
    if (adjacentMines > 0) {
      return Text(
        '$adjacentMines',
        style: const TextStyle(fontWeight: FontWeight.bold),
      );
    }

    return const SizedBox.shrink();
  }
}
