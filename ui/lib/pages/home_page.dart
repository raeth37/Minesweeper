import 'dart:io';
import 'package:minesweeper/components/glass_button.dart';

import '../components/button.dart';
import '../components/navigator.dart';
import 'game_page.dart';
import 'rules_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  
  // ignore: unused_field
  String _difficulty = 'normal';

  void _selectDifficulty(String diff) {
    _difficulty = diff;
  }

  Future<void> _closeApp(BuildContext context) async{
    return showDialog(
      context: context,
      barrierDismissible: false,

      builder: (BuildContext context){
        return AlertDialog(
          content: const Text(
            'Are you sure you want to quit?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
          ),

          backgroundColor: const Color.fromARGB(255, 235, 235, 235),

          actions: [
            TextButton(
              child: const Text('NO'),
              onPressed: () => Navigator.pop(context),
            ),

            TextButton(
              child: const Text('YES'),
              onPressed: () {
                Navigator.pop(context);
                exit(0);
              },
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/assets/images/background.png'),
          fit: BoxFit.fill
        ),
      ),

      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 250),

                  /*
                  Text(
                    'MINESWEEPER',
                    style: const TextStyle(
                      fontFamily: 'Audiowide',
                      color: Color(0xfff2e8cf),
                      fontWeight: FontWeight.w600,
                      fontSize: 125,
                      letterSpacing: 0.6,
                    ),
                  ),
                  */

                  Container(
                    height: 500,
                    width: 900,
                    padding: const EdgeInsets.all(40),
                    decoration: BoxDecoration(
                      color: Colors.transparent, 
                      borderRadius: BorderRadius.circular(20), 
                      
                    ),
                    
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        
                        Column(
                          children: [
                            const SizedBox(height: 65),
                            GlassButton(
                              text: 'START',
                              onTap: () => navigator(context, GamePage()),
                            ),
                            const SizedBox(height: 30),
            
                            GlassButton(
                              text: 'RULES',
                              onTap: () => navigator(context, RulesPage()),
                            ),
                            const SizedBox(height: 30),
                            
                            GlassButton(
                              text: 'QUIT',
                              onTap: () => _closeApp(context)
                            ),
                          ],
                        ),
            
                      ],
                
                    ),
                  
                  ),
                  
                ],
              ),
            ),
          ),

        ),
      ),
    );
  }
}