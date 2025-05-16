import 'package:flutter/material.dart';
import 'package:pedometer/widgets/custom_svg.dart';

class CustomCheckUi extends StatelessWidget {
  final double size;
  const CustomCheckUi({super.key, this.size = 100});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Stack(
        children: [
          Positioned.fill(child: CustomSvg(svgPath: 'assets/images/check.svg')),
          Center(
            child: Icon(Icons.check, color: Colors.green, size: size * 0.7),
          ),
        ],
      ),
    );
  }
}
