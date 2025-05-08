import 'package:flutter/material.dart';
import 'package:pedometer/widgets/shimmer/rectangle_shimmer.dart';

class RoundedShimmer extends StatelessWidget {
  final double size;
  const RoundedShimmer({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return RectangleShimmer(
      height: size,
      width: size,
      borderRadius: BorderRadius.circular(size / 2),
    );
  }
}
