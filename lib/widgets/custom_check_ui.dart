import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomCheckUi extends StatelessWidget {
  const CustomCheckUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Stack(children: [
        SvgPicture.asset('assets/images/Successmark.svg'),
        const Center(child: Icon(Icons.check,color: Colors.green,size: 70,)),
      ]),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height / 2);
    path.lineTo(width - 10, height / 2);
    path.quadraticBezierTo(width - 5, height + 10, width - 10, height / 2 + 10);
    // path.quadraticBezierTo(width - 40, height / 4, width, 0);
    // path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
