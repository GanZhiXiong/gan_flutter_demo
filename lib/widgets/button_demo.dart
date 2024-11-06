import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'shape_button.dart';
import 'trapezium_shape.dart';

class CustomClipperButton extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.2);
    path.lineTo(0, size.height * 0.8);
    path.quadraticBezierTo(0, size.height, size.width * 0.1, size.height);
    path.lineTo(size.width * 0.7 - 10, size.height);
    path.quadraticBezierTo(
        size.width * 0.7, size.height, size.width * 0.7, size.height * 0.95);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.30,
        size.width - 10, size.height * 0.3);
    path.quadraticBezierTo(
        size.width, size.height * 0.3, size.width, size.height * 0.3 - 10);
    path.lineTo(size.width, size.height * 0.2);
    path.quadraticBezierTo(size.width, 0, size.width * 0.9, 0);
    path.lineTo(size.width * 0.1, 0);
    path.quadraticBezierTo(0, 0, 0, size.height * 0.2);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class StarShape extends ShapeBorder {
  @override
  void paint(Canvas canvas, Rect rect, {ui.TextDirection? textDirection}) {
    return;
  }

  @override
  Path getOuterPath(Rect rect, {ui.TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.width / 8, 0)
      ..lineTo(rect.width - rect.width / 8, 0)
      ..lineTo(rect.width, rect.height)
      ..lineTo(0, rect.height)
      ..close();
  }

  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  // @override
  // Path getInnerPath(Rect rect, {TextDirection? textDirection}) => Path();

  @override
  ShapeBorder scale(double t) => StarShape();

  @override
  Path getInnerPath(Rect rect, {ui.TextDirection? textDirection}) {
    return Path();
  }
}

class ButtonDemo extends StatefulWidget {
  const ButtonDemo({super.key});

  @override
  State<ButtonDemo> createState() => _ButtonDemoState();
}

class _ButtonDemoState extends State<ButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Demo'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: ShapeButton(
                  titleWidget: Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  name: 'name',
                  shape: TrapeziumShape(),
                  onTap: () {},
                  onLongPress: () {},
                ),
              ),
              SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 100,
                height: 72,
                child: ShapeButton(
                  titleWidget: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                  name: 'hello',
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                  ),
                  onTap: () {},
                  onLongPress: () {},
                ),
              ),
            ],
          ),
          SizedBox(
              height: 300,
              width: 300,
              child: Material(
                shape: StarShape(),
                // color: Colors.orange,
                child: InkWell(
                  customBorder: StarShape(),
                  splashColor: Colors.yellow,
                  onTap: () => print('it works'),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon(YoSmartIcons.fromIconName(button.icon),
                        //     size: 48),
                        SizedBox(height: 8),
                        Text(
                          'Open Lock' ?? '',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        SizedBox(
            height: 300,
            width: 300,
            child: Material(
              shape: StarShape(),
              color: Colors.orange,
              child: InkWell(
                customBorder: StarShape(),
                splashColor: Colors.yellow,
                onTap: () => print('it works'),
              ),
            )),
        Center(
          child: ClipPath(
            clipper: CustomClipperButton(),
            child: Stack(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: 300,
                    height: 150,
                    color: Colors.purple[900],
                    child: Container(
                      width: 200,
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.pink.shade300,
                            spreadRadius: 0,
                            blurRadius: 20.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: -70,
                  right: -90,
                  child: Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pink.shade800,
                          spreadRadius: 5,
                          blurRadius: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        InkWell(
          splashColor: Colors.green,
          onTap: () {},
          customBorder: const CircleBorder(),
          child: Ink(
            decoration:
                const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
            height: 50,
            width: 50,
            child: const Icon(Icons.holiday_village),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Material(
            color: Colors.grey,
            shape: const CircleBorder(),
            child: InkWell(
              splashColor: Colors.green,
              onTap: () {},
              customBorder: const CircleBorder(),
              child: Ink(
                decoration: const BoxDecoration(shape: BoxShape.circle),
                height: 50,
                width: 50,
                child: const Icon(Icons.holiday_village),
              ),
            ),
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.rectangle_outlined)),
        ElevatedButton(onPressed: () {}, child: Text('Button')),
        SizedBox(
          height: 100,
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Button"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.elliptical(10, 40)
                        //  bottomLeft:, bottom left
                        // bottomRight: bottom right
                        ))),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Button"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.elliptical(10, 40)
                        //  bottomLeft:, bottom left
                        // bottomRight: bottom right
                        ))),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Button"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(120),
                        topRight: Radius.elliptical(10, 40)
                        //  bottomLeft:, bottom left
                        // bottomRight: bottom right
                        ))),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        SizedBox(
          height: 100,
          width: 100,
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Button"),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, shape: LinearBorder()),
          ),
        ),
        InkWell(
          onTap: () => print('Do Something'),
          child: CustomPaint(
            size: Size(200, 50),
            painter: CurvePainter(),
          ),
        )
      ],
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Color(0xFFE32087)
      ..style = PaintingStyle.fill;

    var path = Path()
      ..moveTo(size.width * 0.2, 0)
      ..lineTo(size.width, size.height * 0.2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
