import 'dart:ui';
import 'package:flutter/material.dart';

class GlassButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final double width;
  final double height;

  const GlassButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width = 400,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),

          child: Container(
            width: width,
            height: height,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.transparent,

              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                color: Colors.white,
                width: 1.5,
              ),
            ),

            child: Text(
              text,
              style: const TextStyle(
                fontSize: 36,
                color: Color.fromARGB(255, 255, 255, 255),
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
