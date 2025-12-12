import 'package:flutter/material.dart';

SizedBox button(BuildContext context, String text, VoidCallback onPressed) {
  return SizedBox(

    height: 65,
    width: 250,
    child: ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          const Color.fromARGB(255, 255, 249, 235),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
      
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 36,
          color: Color(0xff386641),
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}