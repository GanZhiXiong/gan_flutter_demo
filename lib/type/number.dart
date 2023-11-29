class Number {
  static String formatNum(num num, int fractionDigits) {
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        fractionDigits) {
      return num.toStringAsFixed(fractionDigits)
          .substring(0, num.toString().lastIndexOf(".") + fractionDigits + 1)
          .toString();
    } else {
      return num.toString()
          .substring(0, num.toString().lastIndexOf(".") + fractionDigits + 1)
          .toString();
    }
  }

  // static num truncateToTwoDecimals(num value) {
  //   return (value * 100).truncateToDouble() / 100;
  // }

  String truncateToTwoDecimalsStr(num value) {
    num truncated = (value * 100).truncate() / 100;
    String str = truncated.toStringAsFixed(2);
    // Remove trailing zeros and the decimal point if not needed
    str = str.replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    return str;
  }

  static num truncateToTwoDecimals(num value) {
    num truncated = (value * 100).truncate() / 100;
    // Remove trailing zeros and the decimal point if not needed
    var str = truncated.toString().replaceAll(RegExp(r"([.]*0+)(?!.*\d)"), "");
    return num.parse(str);
  }

  static num? removeDecimalZeroFormat(num number) {
    RegExp regex = RegExp(r'([.]*0)(?!.*\d)');
    String s = number.toString().replaceAll(regex, '');
    return num.tryParse(s);
  }
}
