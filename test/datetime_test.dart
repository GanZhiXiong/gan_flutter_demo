import 'package:flutter_test/flutter_test.dart';

void main() {
  test('duration test', () {
    Duration a = Duration(hours: 10, minutes: 56);
    print(a);
    Duration b = a;
    print(b);
    a =  Duration(hours: 11, minutes: 57);
    print(a);
    print(b);

    b = a;
    print(b);
    a = Duration(hours: 1) + a;
    print(a);
    print(b);
  });
}
