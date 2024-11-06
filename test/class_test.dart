import 'package:flutter_test/flutter_test.dart';

// class DoublePoint {
//   double x;
//   double y;
//
//   DoublePoint(double x, double y) {
//     this.x = x * 2;
//     this.y = y * 2;
//   }
// }

class DoublePoint1 {
  double x = 0;
  double y = 0;

  DoublePoint1(double x, double y) {
    this.x = x * 2;
    this.y = y * 2;
  }
}

class DoublePoint2 {
  late double x;
  late double y;

  DoublePoint2(double x, double y) {
    this.x = x * 2;
    this.y = y * 2;
  }
}

class DoublePoint3 {
  double? x;
  double? y;

  DoublePoint3(double x, double y) {
    this.x = x * 2;
    this.y = y * 2;
  }
}

class DoublePoint4 {
  double x;
  double y;

  DoublePoint4(double x, double y)
      : x = x * 2,
        y = y * 2 {
    print('x: $x, y: $y');
    print('this.x: ${this.x}, this.y: ${this.y}');
  }
}

class DoublePoint5 {
  final double x;
  final double y;

  DoublePoint5(this.x, this.y);

  DoublePoint5.a({required this.x, required this.y});

  DoublePoint5.b({this.x = 1, this.y = 2});
}

void main() {
  test('test', () {});
}
