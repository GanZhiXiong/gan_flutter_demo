import 'package:flutter/material.dart';

class AdjustableRoundedRectangle extends StatefulWidget {
  @override
  _AdjustableRoundedRectangleState createState() => _AdjustableRoundedRectangleState();
}

class _AdjustableRoundedRectangleState extends State<AdjustableRoundedRectangle> {
  double _fillHeight = 50; // Initial fill height of the rectangle

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: RoundedRectPainter(fillHeight: _fillHeight),
          ),
        ),
        Slider(
          min: 0,
          max: 200,
          divisions: 200,
          value: _fillHeight,
          onChanged: (newValue) {
            setState(() {
              _fillHeight = newValue;
            });
          },
        ),
      ],
    );
  }
}

class RoundedRectPainter extends CustomPainter {
  double fillHeight; // The current fill height of the rectangle's background
  RoundedRectPainter({required this.fillHeight});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint borderPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    final Paint fillPaint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    // Define the rectangle area
    Rect rect = Offset.zero & size;
    // Define the radius for the corners
    double radius = 20.0;

    // Draw the border
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      borderPaint,
    );

    // Calculate the fill rectangle
    Rect fillRect = Rect.fromLTRB(
      rect.left,
      rect.bottom - fillHeight,
      rect.right,
      rect.bottom,
    );

    // Draw the fill
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        fillRect,
        bottomLeft: Radius.circular(radius),
        bottomRight: Radius.circular(radius),
      ),
      fillPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true; // You can add more logic here for optimization
  }
}