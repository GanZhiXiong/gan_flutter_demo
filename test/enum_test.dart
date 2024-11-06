import 'package:flutter_test/flutter_test.dart';

enum EnumTest {
  value1,
  value2,
  value3,
  value4,
  value5,
  value6,
  value7,
  value8,
  value9,
  value10,
  value11,
  value12,
  value13,
  value14,
  value15,
  value16,
  value17,
  value18,
  value19,
  value20,
  value21,
  value22,
  value23,
  value24,
  value25,
  value26,
  value27,
  value28,
  value29,
  value30,
  value31,
  value32
}

class A {
  String? a = 'a';

  A({this.a});

  @override
  String toString() {
    return 'A{a: $a}';
  }
}

void main() {
  test('enum values', () {
    var a1 = A();
    print(a1);

    a1 = A(a: 'b');
    print(a1);

    var json = {
      'a': 'b'
    };
    dynamic a;
    a.map((e) => 'a');
    EnumTest.values.byName('a');
    EnumTest.values.byName(json['b']!);
  });
}
