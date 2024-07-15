import 'package:flutter_test/flutter_test.dart';
import 'package:gan_flutter_demo/type/number.dart';
import 'package:intl/intl.dart';

void main() {

  test('num parse', () {
    dynamic a = '123';
    print(num.parse(a));
    a = 1.23;
    print(num.parse(a.toString()));
    print(num.parse(a));
    var b = 1 as double;
  });

  test('IEEE 754 双精度标准', () {
    // [浮点 - 为什么不使用 Double 或 Float 来表示货币？ - 堆栈溢出](https://stackoverflow.com/questions/3730019/why-not-use-double-or-float-to-represent-currency/3730040#3730040)
    // [Is floating point math broken? - Stack Overflow](https://stackoverflow.com/questions/588004/is-floating-point-math-broken)
    var a = 1.0;
    var b = 1;
    var c = 1.1;
    print(a - b);
    print(c - b);
    print(0.2 + 0.1);
    print(100 / 3);
    print(2.11 + 0.42);
    print(134.89 + 84.02);

    final formatter = NumberFormat.currency(
      // locale: 'hi_IN',
      decimalDigits: 2,
      symbol: '',
    );
    final formattedValue = formatter.format(num.parse('1234512.01'));
    print(formattedValue);
    print(0.1 + 0.2);
    final formattedValue1 = formatter.format(0.1 + 0.2);
    print(formattedValue1);
    print(formatter.format(0.123456789));
    print(formatter.format(0.1245));
    print(formatter.format(0.1256));
    print(formatter.format(1.00000));
    print(formatter.format(0.10000));

    print('##,###,###.##');
    var format = NumberFormat('##,###,###.##');
    print(formatter.format(0.1 + 0.2));
    print(formatter.format(0.123456789));
    print(formatter.format(0.1245));
    print(formatter.format(0.1256));
    print(formatter.format(1.00000));
    print(formatter.format(0.10000));

    print('toStringAsFixed');
    print((0.1 + 0.2).toStringAsFixed(2));
    print(1234567.4567.toStringAsFixed(2));
    print(1234567.4557.toStringAsFixed(2));
    print(1234567.4547.toStringAsFixed(2));
    print(1234567.0000.toStringAsFixed(2));
    print(1234567.1000.toStringAsFixed(2));
    print(1234567.9999.toStringAsFixed(2));

    print('''NumberFormat('#.#')''');
    format = NumberFormat('#.#');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('##.#')''');
    format = NumberFormat('##.#');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('##.##')''');
    format = NumberFormat('##.##');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('#.0')''');
    format = NumberFormat('#.0');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('##.0')''');
    format = NumberFormat('##.0');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('##.0#')''');
    format = NumberFormat('##.0#');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('##.00')''');
    format = NumberFormat('##.00');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('0.00')''');
    format = NumberFormat('0.00');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('0.0#')''');
    format = NumberFormat('0.0#');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('0.##') 将移除小数后面的0''');
    format = NumberFormat('0.##');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('#.##')''');
    format = NumberFormat('#.##');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('###.0#')''');
    format = NumberFormat('###.0#');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('###.00')''');
    format = NumberFormat('###.00');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));

    print('''NumberFormat('0.00')''');
    format = NumberFormat('0.00');
    print(format.format((0.1 + 0.2)));
    print(format.format(1.4567));
    print(format.format(12.4557));
    print(format.format(123.4547));
    print(format.format(1234.0000));
    print(format.format(12345.1000));
    print(format.format(123456.9999));
  });

  test('description', () {
    double a = 134.89;
    double b = 84.02;
    double c = a - b;

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
