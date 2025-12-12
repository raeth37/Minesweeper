import 'package:flutter/material.dart';
import 'package:minesweeper/components/navigator.dart';

class RulesPage extends StatefulWidget{
  const RulesPage({super.key});

  @override
  State<RulesPage> createState() => _RulesPage();
}

class _RulesPage extends State<RulesPage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: backButton(context),
    );
  }
  
}
