import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  group('cancel test', () {
    test('cancel', () async {
      print('cancel');
      final eventStreamController = StreamController<String>.broadcast();
      var subscription1 = eventStreamController.stream.listen((event) {
        print('listen 1: $event');
      });
      var subscription2 = eventStreamController.stream.listen((event) {
        print('listen 11: $event');
      });
      eventStreamController.add('event 1');
      eventStreamController.add('event 2');
      subscription1.cancel();
      subscription1.cancel();
      subscription1.cancel();
      subscription2.cancel();
      eventStreamController.add('event 3');

    });

    // test('cancel 1', () async {
    //   print('cancel 1');
    //   final eventStreamController = StreamController<String>.broadcast();
    //   var subscription1 = eventStreamController.stream.listen((event) {
    //     print('listen 1: $event');
    //   });
    //   subscription1 = eventStreamController.stream.listen((event) {
    //     print('listen 1: $event');
    //   });
    //   eventStreamController.add('event 1');
    //   subscription1.cancel();
    //   eventStreamController.add('event 2');
    // });

    // test('cancel->listen', () async {
    //   final eventStreamController = StreamController<String>.broadcast();
    //   var subscription1 = eventStreamController.stream.listen((event) {
    //     print('listen 1: $event');
    //   });
    //   eventStreamController.add('event 1');
    //   subscription1.cancel();
    //   subscription1 = eventStreamController.stream.listen((event) {
    //     print('listen 11: $event');
    //   });
    //   eventStreamController.add('event 2');
    // });
    //
    // test('cancel one listen', () async {
    //   final eventStreamController = StreamController<String>.broadcast();
    //   var subscription1 = eventStreamController.stream.listen((event) {
    //     print('listen 1: $event');
    //   });
    //   subscription1 = eventStreamController.stream.listen((event) {
    //     print('listen 11: $event');
    //   });
    //
    //   eventStreamController.add('event 1');
    //   await Future.delayed(Duration(seconds: 3), () {
    //     subscription1.cancel();
    //     subscription1.cancel();
    //     eventStreamController.add('event 2');
    //   });
    //   // subscription1 = eventStreamController.stream.listen((event) {
    //   //   print('listen 11: $event');
    //   // });
    //   // eventStreamController.add('event 2');
    // });
    //
    // test('cancel all listen', () async {
    //   final eventStreamController = StreamController<String>.broadcast();
    //   var subscription1 = eventStreamController.stream.listen((event) {
    //     print('listen 1: $event');
    //   });
    //   subscription1.cancel();
    //   subscription1 = eventStreamController.stream.listen((event) {
    //     print('listen 11: $event');
    //   });
    //   subscription1.cancel();
    //
    //   eventStreamController.add('event 1');
    //   await Future.delayed(Duration(seconds: 3), () {
    //     subscription1.cancel();
    //     subscription1.cancel();
    //     eventStreamController.add('event 2');
    //   });
    //   // subscription1 = eventStreamController.stream.listen((event) {
    //   //   print('listen 11: $event');
    //   // });
    //   // eventStreamController.add('event 2');
    // });
  });
}
