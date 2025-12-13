import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DecorativeCircleBackground extends StatelessWidget {
  final Color color;
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double size;

  const DecorativeCircleBackground({
    super.key,
    required this.color,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.size = 342,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        width: size.w,
        height: size.h,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
