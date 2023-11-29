import 'dart:math';

import 'package:flutter/material.dart';

class WaterTankWithRuler extends StatefulWidget {
  @override
  _WaterTankWithRulerState createState() => _WaterTankWithRulerState();
}

class _WaterTankWithRulerState extends State<WaterTankWithRuler> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animationController.value = 0.5; // Initial water level set to 50%
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Ruler(scale: 300),
            SizedBox(width: 8,),
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return CustomPaint(
                  painter: WaterTankPainter(waterLevel: _animationController.value),
                  child: Container(
                    width: 200,
                    height: 300,
                  ),
                );
              },
            ),
          ],
        ),
        Slider(
          value: _animationController.value,
          onChanged: (newValue) {
            setState(() {
              _animationController.value = newValue;
            });
          },
          min: 0.0,
          max: 1.0,
          divisions: 100,
          label: '${(_animationController.value * 100).round()}%',
        ),
      ],
    );
  }
}

class Ruler extends StatelessWidget {
  final double scale;

  const Ruler({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: RulerPainter(scale),
      child: Container(
        width: 20,
        height: scale,
      ),
    );
  }
}

class RulerPainter extends CustomPainter {
  final double scale;

  RulerPainter(this.scale);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    // Draw ruler line
    canvas.drawLine(Offset(size.width, 0), Offset(size.width, size.height), paint);

    // Draw scale marks and numbers
    var step = scale / 10;
    for (var i = 0; i <= 10; i++) {
      double y = i * step;
      canvas.drawLine(
        Offset(size.width - 10, y),
        Offset(size.width, y),
        paint,
      );

      TextSpan span = new TextSpan(
        style: new TextStyle(color: Colors.black, fontSize: 10),
        text: '${(10 - i) * 10}',
      );
      TextPainter tp = new TextPainter(
          text: span,
          textAlign: TextAlign.left,
          textDirection: TextDirection.ltr);
      tp.layout();
      tp.paint(canvas, new Offset(0, y - 5));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


// ...

class WaterTankPainter extends CustomPainter {
  final double waterLevel; // Water level value between 0 (empty) and 1 (full)
  final double cornerRadius; // The radius of the tank's bottom corners

  WaterTankPainter({this.waterLevel = 1, this.cornerRadius = 20.0});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint tankPaint = Paint()
      ..color = Colors.grey[700]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final Paint waterPaint = Paint()
      ..color = Colors.blue[300]!
      ..style = PaintingStyle.fill;

    // Draw tank
    final Path tankPath = Path()
      ..moveTo(cornerRadius, 0) // Start from the top left corner
      ..lineTo(size.width - cornerRadius, 0) // Top side
      ..lineTo(size.width, 0) // Top right corner (straight)
      ..lineTo(size.width, size.height - cornerRadius) // Right side
    // Bottom right corner
      ..arcTo(
        Rect.fromCircle(center: Offset(size.width - cornerRadius, size.height - cornerRadius), radius: cornerRadius),
        0,
        pi / 2,
        false,
      )
      ..lineTo(cornerRadius, size.height) // Bottom side
    // Bottom left corner
      ..arcTo(
        Rect.fromCircle(center: Offset(cornerRadius, size.height - cornerRadius), radius: cornerRadius),
        pi / 2,
        pi / 2,
        false,
      )
      ..lineTo(0, 0) // Left side
      ..close();

    canvas.drawPath(tankPath, tankPaint);

    // Draw water
    if (waterLevel > 0) {
      final Path waterPath = Path();
      double waterTop = size.height - waterLevel * size.height; // Top Y position of water

      // Check if the water is above the corner radius
      if (waterTop <= size.height - cornerRadius) {
        // Water is above the rounded corners, so it's just a rectangle
        waterPath.moveTo(0, waterTop);
        waterPath.lineTo(size.width, waterTop);
        waterPath.lineTo(size.width, size.height - cornerRadius);
        waterPath.arcTo(
          Rect.fromCircle(center: Offset(size.width - cornerRadius, size.height - cornerRadius), radius: cornerRadius),
          0,
          pi / 2,
          false,
        );
        waterPath.lineTo(cornerRadius, size.height);
        waterPath.arcTo(
          Rect.fromCircle(center: Offset(cornerRadius, size.height - cornerRadius), radius: cornerRadius),
          pi / 2,
          pi / 2,
          false,
        );
        waterPath.close();
      } else {
        // Water is within the rounded corners
        // #todo 当水低于圆角高度时，水还是超出了水箱
        double arcStartAngle = asin((size.height - waterTop - (size.height - 2 * cornerRadius)) / cornerRadius);
        waterPath.moveTo(cornerRadius - cornerRadius * cos(arcStartAngle), size.height - cornerRadius + cornerRadius * sin(arcStartAngle));
        waterPath.arcTo(
          Rect.fromCircle(center: Offset(cornerRadius, size.height - cornerRadius), radius: cornerRadius),
          pi - arcStartAngle,
          2 * arcStartAngle,
          false,
        );
        waterPath.lineTo(size.width - cornerRadius + cornerRadius * cos(arcStartAngle), size.height - cornerRadius + cornerRadius * sin(arcStartAngle));
        waterPath.arcTo(
          Rect.fromCircle(center: Offset(size.width - cornerRadius, size.height - cornerRadius), radius: cornerRadius),
          -arcStartAngle,
          2 * (pi / 2 - arcStartAngle),
          false,
        );
        waterPath.close();
      }

      canvas.drawPath(waterPath, waterPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
