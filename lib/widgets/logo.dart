import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logo extends StatelessWidget {
  final double radius;
  const Logo({super.key, this.radius = 40});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: radius * 2,
        width: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          // image: DecorationImage(image: AssetImage('assets/images/logo.png'),fit: BoxFit.cover),
          border: Border.all(color: Get.theme.colorScheme.secondary, width: 2.0),
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundColor: Colors.transparent,
          child: Image.asset(
            'assets/images/logo.png',
            height: radius*0.8,
            width: radius*0.8,
            // fit: BoxFit.cover,
          ),
        )
        );
  }
}
