import 'package:flutter_test/flutter_test.dart';

void main() {
  test('null', () {
    dynamic? a;
    if (a is String) {}
  });

  test('optional test', () {
    String? a;
    print(a?.isEmpty);
    print(a?.isEmpty == true);
    print(a?.isNotEmpty);
    print(a?.isNotEmpty == true);
    a = '';
    print(a.isEmpty);
    a = ' ';
    print(a.isEmpty);
  });

  test2({int? a = 1}) {
    print(a);
  }

  test1({int? a}) {
    print(a);
    test2(a: a);
  }

  test('optional function test', () {
    print('test1');
    test1();
    print('test1(a: 2);');
    test1(a: 2);
    print('test2');
    test2();
    print('test2(a: 2);');
    test2(a: 2);
  });
}
