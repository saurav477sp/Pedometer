import 'package:flutter/material.dart';
import 'dart:ui';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Blurred background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
          child: Container(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        // Centered CircularProgressIndicator
        Center(
          child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(10),
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 4,
            ),
          ),
        ),
      ],
    );
  }
}
