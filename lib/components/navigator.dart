import 'package:flutter/material.dart';

void navigator(BuildContext context, Widget page){
  Navigator.push(
    context, 
    MaterialPageRoute(builder: (context) => page)
  );
}

AppBar backButton(BuildContext context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.black),
      onPressed: () => Navigator.pop(context),
    ),
  );
}