import 'package:flutter/material.dart';

class BackIcon extends StatelessWidget {
  final double height;
  final double width;
  const BackIcon({super.key, this.height = 44, this.width = 44});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
          height: height,
          width: width,
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              color: Colors.transparent,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(color: Colors.white)
              ),
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
    );
  }
}
