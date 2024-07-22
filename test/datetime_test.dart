import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_time_patterns.dart';

void main() {
  test("time zone 1", () {
    print(DateTime.now().isUtc);
    print(DateTime.now().toUtc().isUtc);
    print(DateTime.parse('2024-07-20 00:00:00').toLocal());
    print(DateTime.parse('2024-07-20 00:00:00Z').toLocal());
    final now = DateTime.now();
    print(now.toString());
    print(now.toIso8601String());
    print(now.toUtc().toString());
    print(now.toUtc().toIso8601String());
    print(DateFormat.jm().format(now));
    print(DateFormat.jmv().format(now));
    print(DateFormat.jms().format(now));
    print(DateFormat.jmz().format(now));
    print(now);
    print(now.toLocal());
    print(now.toUtc());
    print(now.toUtc().toLocal());

    var date = "2022-09-04T13:00:00+00:00";

    var dateValue = DateFormat('yyy-MM-ddTHH:mmZ').parseUTC(date).toLocal();
    print(dateValue);
    String formattedDate = DateFormat("dd MMMM yyyy").format(dateValue);
    String formattedTime = DateFormat("HH:mm").format(dateValue);
    print(formattedDate);
    print(formattedTime);

    final dateChina = DateTime.parse('2024-07-20 00:00:00Z').toLocal();
    print(dateChina);
    print(DateTime.now());
    print(DateTime.now().timeZoneName);
    print(DateTime.now().timeZoneOffset);
    print(DateTime.now().toLocal());

    print(DateTime.now().toUtc());
    print(DateTime.now().toUtc().timeZoneName);
    print(DateTime.now().toUtc().timeZoneOffset);
  });

  test('timestamp to time zone', () {
    int timestamp = 1721406217 * 1000; // 时间戳，示例为 2021-07-19 12:00:00 UTC
    print(DateTime.fromMillisecondsSinceEpoch(timestamp));
    int timeZoneOffset = 4; // 目标时区的偏移量，示例为 +02:00

    Duration offset = Duration(hours: timeZoneOffset);

    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(timestamp, isUtc: true);
    DateTime targetDateTime = dateTime.add(offset);

    print(targetDateTime); // 输出: 2021-07-19 14:00:00.000
  });

  test('unix time', () {
    print(DateTime.now().timeZoneOffset.inHours);
    final unixTime = DateTime.now().millisecondsSinceEpoch;
    print(unixTime);
    final a = DateTime.fromMillisecondsSinceEpoch(unixTime);
    print(a);
    final b = DateTime.fromMillisecondsSinceEpoch(unixTime, isUtc: true);
    print(b);
    print(DateTime.now().toUtc().add(Duration(hours: 8)));
    print('DateTime.now().toLocal(): ${DateTime.now().toLocal()}');
    print('DateTime.now().toUtc(): ${DateTime.now().toUtc()}');
  });

  test('format', () {
    print(DateFormat('M/dd hh:mm a').format(DateTime.now()));

    String date =
        DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'").format(DateTime.now());
    print(date);

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
    a = Duration(hours: 11, minutes: 57);
    print(a);
    print(b);

    b = a;
    print(b);
    a = Duration(hours: 1) + a;
    print(a);
    print(b);
  });

  List<String> generateMonthList(DateTime startDate, DateTime endDate) {
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

    DateTime startDate = DateTime.now(); //DateTime(2022, 2, 6);
    DateTime endDate = DateTime.now();

    List<String> monthList = generateMonthList(startDate, endDate);

    print(monthList);
  });

  test('date time compare', () {
    var date =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(Duration(days: 1));
    var date1 =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    print(date == date1);
    // date = date.add(Duration(days: 1));

    final a =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(Duration(days: -1, seconds: 2))
            .isAfter(DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day));
    final b = DateTime(
            DateTime.now().year, DateTime.now().month, DateTime.now().day)
        .add(Duration(days: -1, seconds: 1))
        .isAfter(DateTime(
                DateTime.now().year, DateTime.now().month, DateTime.now().day)
            .add(Duration(days: -1)));
  });
}
