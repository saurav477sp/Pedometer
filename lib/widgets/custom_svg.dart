import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pedometer/widgets/shimmer/rectangle_shimmer.dart';

class CustomSvg extends StatelessWidget {
  final bool isNetwork;
  final String svgPath;
  final double height;
  final double width;
  final Color? color;
  final Function()? onTap;
  const CustomSvg({
    super.key,
    required this.svgPath,
    this.height = 20,
    this.width = 20,
    this.color,
    this.onTap,
    this.isNetwork = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
          isNetwork
              ? SvgPicture.network(
                svgPath,
                height: height,
                width: width,
                color: color,
                placeholderBuilder:
                    (context) => RectangleShimmer(height: height, width: width),
                errorBuilder:
                    (context, error, stackTrace) => Image.asset(
                      'assets/images/logo.png',
                      height: height,
                      width: width,
                      color: color,
                    ),
              )
              : SvgPicture.asset(
                svgPath,
                height: height,
                width: width,
                color: color,
              ),
    );
  }
}
