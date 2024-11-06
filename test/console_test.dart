import 'dart:developer';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

/*
-. [Flutter：何时使用“print”和“debugPrint”？ - VoidCC](https://stackoverflow.com/questions/66841141/flutter-when-to-use-print-and-debugprint)
-. [ios - Flutter 中的 print() 与 debugPrint() 和 log() 之间有什么实际区别？ - 问答 - 云+社区 - 腾讯云](https://stackoverflow.com/questions/75005631/what-are-the-actual-differences-between-the-print-vs-debugprint-and-log-in)
 */
void main() {
  test(
    'console test',
    () {
      String? a;
      print(a?.isEmpty);
      print(a?.isNotEmpty);
      String? b = ' ';
      print(b.isEmpty);
      print(b.isNotEmpty);

      var map = {
        '1': 'a',
        '2': 'b',
        '3': 'c',
        '4': 'd',
        '5': 'e',
        '6': 'f',
        '7': 'g',
        '8': 'h',
        '9': 'i',
        '10': 'j',
      };
      final json = jsonEncode(map);
      print(json);
      debugPrint(json);
      log(json);
      log("""
      A long multiline string
      A long multiline string
      A long multiline string
      A long multiline string
      A long multiline string
      A long multiline string
      """);
    },
  );
}
