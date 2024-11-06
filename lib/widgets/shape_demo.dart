import 'package:flutter/material.dart';

class ShapeDemo extends StatefulWidget {
  const ShapeDemo({super.key});

  @override
  State<ShapeDemo> createState() => _ShapeDemoState();
}

class _ShapeDemoState extends State<ShapeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shape Demo'),
      ),
      body: Column(
        children: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.copy,
              )),
          InkWell(
            onTap: () {},
            child: Text('aaa'),
          ),
          Container(
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.copy,
                    )),
                InkWell(
                  onTap: () {},
                  child: Text('aaa'),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 100,
              width: 100,
              child: Material(
                color: Colors.blue,
                shape: Shape1(),
                child: InkWell(
                  splashColor: Colors.green,
                  customBorder: Shape1(),
                  onTap: () {
                    print('onTap');
                  },
                ),
              )),
          InkWell(
            splashColor: Colors.green,
            customBorder: Shape1(),
            child: Container(
              width: 100,
              height: 100,
              // color: Colors.blue,
            ),
            onTap: () {
              print('onTap');
            },
          ),
          SizedBox(
              height: 100,
              width: 100,
              child: Material(
                color: Colors.blue,
                shape: Shape2(),
                child: InkWell(
                  splashColor: Colors.green,
                  customBorder: Shape2(),
                  onTap: () {
                    print('onTap');
                  },
                ),
              ))
        ],
      ),
    );
  }
}

class Shape1 extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(0, 50)
      ..lineTo(50, 0)
      ..lineTo(100, 50)
      ..lineTo(50, 100);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
}

class Shape2 extends ShapeBorder {
  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => throw UnimplementedError();

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    // TODO: implement getInnerPath
    throw UnimplementedError();
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(0, 50)
      ..quadraticBezierTo(0, 0, 50, 0)
      // ..lineTo(50, 0)
      ..lineTo(100, 50)
      ..lineTo(50, 100);
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    throw UnimplementedError();
  }
}
