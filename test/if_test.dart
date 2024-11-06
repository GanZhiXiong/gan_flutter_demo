import 'package:flutter_test/flutter_test.dart';

void main() {
  void test1(bool a, List<String> as, bool b, List<String> bs) {
    print('\n');
    print('A ${a ? '勾选' : '不勾选'}， A 中有 ${as.length} 个 o。');
    print('B ${b ? '勾选' : '不勾选'}， B 中有 ${bs.length} 个 o。');
    // if ((as.length == 0 && bs.length == 0) || (a && b) || (!a && !b)) {
    //   print('不往下执行');
    //   return;
    // }
    if (!(a && as.length != 0) && !(b && bs.length != 0)) {
      print('不往下执行');
      return;
    }
    print('往下执行');
  }

  test('A 不勾选，B 不勾选，', () {
    test1(false, ['o'], false, ['o']);
    test1(false, ['o'], false, []);
    test1(false, [], false, ['o']);
    test1(false, [], false, []);

    test1(true, ['o'], false, ['o']);
    test1(true, ['o'], false, []);
    test1(true, [], false, ['o']);
    test1(true, [], false, []);

    test1(false, ['o'], true, ['o']);
    test1(false, ['o'], true, []);
    test1(false, [], true, ['o']);
    test1(false, [], true, []);

    test1(true, ['o'], true, ['o']);
    test1(true, ['o'], true, []);
    test1(true, [], true, ['o']);
    test1(true, [], true, []);
  },);
}