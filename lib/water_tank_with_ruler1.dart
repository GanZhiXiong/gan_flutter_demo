import 'package:flutter/material.dart';

class WaterTankWithRuler1 extends StatefulWidget {
  @override
  _WaterTankWithRuler1State createState() => _WaterTankWithRuler1State();
}

class _WaterTankWithRuler1State extends State<WaterTankWithRuler1> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _waterLevelAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _waterLevelAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    )..addListener(() {
      setState(() {});
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Ruler(scale: 300),
        AnimatedBuilder(
          animation: _waterLevelAnimation,
          builder: (context, child) {
            return CustomPaint(
              painter: WaterTankPainter(_waterLevelAnimation.value),
              child: Container(
                width: 200,
                height: 300,
              ),
            );
          },
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
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class WaterTankPainter extends CustomPainter {
  final double waterLevel;

  WaterTankPainter(this.waterLevel);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.blue[700]!;
    final path = Path();

    // Draw tank
    path.moveTo(0, size.height);
    path.lineTo(0, size.height * (1 - waterLevel)); // Left side
    path.lineTo(size.width, size.height * (1 - waterLevel)); // Top
    path.lineTo(size.width, size.height); // Right side
    path.arcToPoint(
      Offset(0, size.height),
      radius: Radius.circular(20.0),
      clockwise: false,
    );
    canvas.drawPath(path, paint);

    // Draw rope
    final ropePaint = Paint()
      ..color = Colors.brown
      ..strokeWidth = 3;
    canvas.drawLine(
      Offset(size.width - 5, 0),
      Offset(size.width - 5, size.height * (1 - waterLevel)),
      ropePaint,
    );
  }

  @override
  bool shouldRepaint(covariant WaterTankPainter oldDelegate) {
    // Return true if the old water level is different from the new one
    return oldDelegate.waterLevel != waterLevel;
  }

// @override
  // bool shouldRepaint(covariant CustomPainter oldDelegate) {
  //   // TODO: implement shouldRepaint
  //   // throw UnimplementedError();
  //   // return super.shouldRepaint(oldDelegate);
  // }
}

