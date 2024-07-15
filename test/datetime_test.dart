import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

void main() {
  test('format', () {
    print(DateFormat('M/dd hh:mm a').format(DateTime.now()));

    // String locale = Localizations.localeOf(context).languageCode;
    // DateTime now = new DateTime.now();
    // String dayOfWeek = DateFormat.EEEE(locale).format(now);
    // String dayMonth = DateFormat.MMMMd(locale).format(now);
    // String year = DateFormat.y(locale).format(now);
  });

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

  List<String>  generateMonthList(DateTime startDate, DateTime endDate) {
    List<String> monthList = [];

    DateTime currentMonth = DateTime(startDate.year, startDate.month);
    DateTime lastMonth = DateTime(endDate.year, endDate.month);

    while (currentMonth.isBefore(lastMonth) || currentMonth == lastMonth) {
      String formattedMonth = DateFormat('yyyy-MM').format(currentMonth);
      monthList.add(formattedMonth);

      currentMonth = DateTime(currentMonth.year, currentMonth.month + 1);
    }

    return monthList;
  }

  test('date time range', () {
    // final startDate = DateTime(2024, 1, 1);
    // final endDate = DateTime(2024, 6, 30);
    // final dateRange = DateTimeRange(start: startDate, end: endDate);

    // dateRange.forEach((date) {
    //   final monthYear = DateFormat('MMM yyyy').format(date);
    //   print(monthYear);
    // });

    DateTime startDate = DateTime.now();//DateTime(2022, 2, 6);
    DateTime endDate = DateTime.now();

    List<String> monthList = generateMonthList(startDate, endDate);

    print(monthList);
  });

  test('date time compare', () {
    var date =
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day).add(Duration(days: 1));
    var date1 =
    DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    print(date == date1);
    // date = date.add(Duration(days: 1));

    final a = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day)
        .add(Duration(days: -1, seconds: 2))
        .isAfter(DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
    final b = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day)
        .add(Duration(days: -1, seconds: 1))
        .isAfter(DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day)
        .add(Duration(days: -1)));
  });
}
