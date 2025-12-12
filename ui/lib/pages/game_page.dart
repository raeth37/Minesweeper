import 'package:flutter/material.dart';
import 'package:minesweeper/components/grid_widget.dart';
import 'package:minesweeper/components/navigator.dart';

class GamePage extends StatefulWidget{
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePage();
}

class _GamePage extends State<GamePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: backButton(context),
      body: Center(
        child: MinesweeperGridWidget(
          rows: 10,
          cols: 10,
          mines: 10,
        ),
      ),
    );
  }
  
}
