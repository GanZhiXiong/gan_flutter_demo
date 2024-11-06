import 'package:flutter/material.dart';

class TrapeziumShape extends ShapeBorder {
  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    return;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    final Path path = Path()
      ..moveTo(8, 10)
      ..quadraticBezierTo(8, 0, 8 + 10, 0)
      ..lineTo(rect.width - 10 - 8, 0)
      ..quadraticBezierTo(rect.width - 8, 0, rect.width - 8, 10)
      ..lineTo(rect.width, rect.height - 10)
      ..quadraticBezierTo(rect.width, rect.height, rect.width - 10, rect.height)
      ..lineTo(10, rect.height)
      ..quadraticBezierTo(0, rect.height, 0, rect.height - 10);
    return path;
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  ShapeBorder scale(double t) => TrapeziumShape();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return Path();
  }
}
