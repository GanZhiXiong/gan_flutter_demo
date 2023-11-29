import 'package:flutter_test/flutter_test.dart';
import 'package:gan_flutter_demo/type/number.dart';

void main() {
  test('description', () {
    num value = 12.3456;
    String formattedValue = value.toStringAsFixed(2);
    print(formattedValue); // 输出: "12.34"

    print(Number.formatNum(value, 0));
    print(Number.formatNum(value, 1));
    print(Number.formatNum(value, 2));
    print(Number.formatNum(value, 3));

    value = 9.9999999;
    print(Number.formatNum(value, 0));
    print(Number.formatNum(value, 1));
    print(Number.formatNum(value, 2));
    print(Number.formatNum(value, 3));

    print('truncateToTwoDecimals');
    value = 99;
    print(value);
    print(Number.truncateToTwoDecimals(value));
    value = 99.00;
    print(Number.truncateToTwoDecimals(value));
    print(Number.removeDecimalZeroFormat(value));
    value = 99.9;
    print(Number.truncateToTwoDecimals(value));
    value = 99.99;
    print(Number.truncateToTwoDecimals(value));
    value = 99.999;
    print(Number.truncateToTwoDecimals(value));
    print(value.truncate());
    print(value.truncateToDouble());
  });
}