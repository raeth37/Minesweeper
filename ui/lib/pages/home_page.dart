import 'dart:io';
import 'package:minesweeper/components/button.dart';
import 'package:minesweeper/components/navigator.dart';
import 'package:minesweeper/pages/game_page.dart';
import 'package:minesweeper/pages/rules_page.dart';
import 'package:minesweeper/pages/settings_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});

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
    return Scaffold(
      backgroundColor: Color.fromRGBO(76, 96, 87, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),

                Text(
                  'MINESWEEPER',
                  style: const TextStyle(
                    fontFamily: 'Audiowide',
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 120,
                    letterSpacing: 0.5,
                  ),
                ),
          
                const SizedBox(height: 25),
          
                Container(
                  height: 450,
                  width: 800,
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.grey, 
                    borderRadius: BorderRadius.circular(20), 
                    
                  ),
                  
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Column(
                        children: [
                          button(context, 'START', () => navigator(context, GamePage())),
                          const SizedBox(height: 30),
          
                          button(context, 'SETTINGS', () => navigator(context, SettingsPage())),
                          const SizedBox(height: 30),
          
                          button(context, 'RULES', () => navigator(context, RulesPage())),
                          const SizedBox(height: 30),
          
                          button(context, 'QUIT', () => _closeApp(context)),
                        ],
                      ),
          
                      const SizedBox(width: 60),
          
                      Container(
                        height: 392,
                        width: 362,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white, 
                          borderRadius: BorderRadius.circular(20), 
                          
                        ),
                      ),
                    ],
              
                  ),
                 
                ),
                
              ],
            ),
          ),
        ),

      ),
    );
  }
}