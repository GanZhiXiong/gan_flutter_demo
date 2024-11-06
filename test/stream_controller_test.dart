import 'dart:async';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('stream controller test1', () async {
    final eventStreamController = StreamController<String>.broadcast();

    var subscription1 = eventStreamController.stream.listen((event) {
      print('listen 1: $event');
    });
    subscription1.onData(
      (data) {
        print('subscription1.onData: $data');
      },
    );
    subscription1.onError(
      (error) {
        print('subscription1.onError: $error');
      },
    );
    subscription1.onDone(() {
      print('subscription1.onDone');
    });
    var subscription2 = eventStreamController.stream.listen((event) {
      print('listen 2: $event');
    });

    // subscription2.pause();
    subscription2.cancel();
    eventStreamController.add('event 1');
    eventStreamController.add('event 2');
    await Future.delayed(
      Duration(seconds: 15),
      () {
        print('subscription2.resume();');
        subscription2.resume();
        // subscription2 = eventStreamController.stream.listen((event) {
        //   print('listen 2: $event');
        // });
        eventStreamController.add('event 3');
      },
    );

    // eventStreamController.close();
    // eventStreamController.add('event 2');
  });

  group('cancel', () {
    test('cancel 1', () async {
      final eventStreamController = StreamController<String>.broadcast();
      var subscription1 = eventStreamController.stream.listen((event) {
        print('listen 1: $event');
      });
      eventStreamController.add('event 1');
      subscription1.cancel();
      eventStreamController.add('event 2');
    });

    test('cancel->listen', () async {
      final eventStreamController = StreamController<String>.broadcast();
      var subscription1 = eventStreamController.stream.listen((event) {
        print('listen 1: $event');
      });
      eventStreamController.add('event 1');
      subscription1.cancel();
      subscription1 = eventStreamController.stream.listen((event) {
        print('listen 11: $event');
      });
      eventStreamController.add('event 2');
    });

    test('cancel one listen', () async {
      final eventStreamController = StreamController<String>.broadcast();
      var subscription1 = eventStreamController.stream.listen((event) {
        print('listen 1: $event');
      });
      subscription1 = eventStreamController.stream.listen((event) {
        print('listen 11: $event');
      });

      eventStreamController.add('event 1');
      await Future.delayed(Duration(seconds: 3), () {
        subscription1.cancel();
        subscription1.cancel();
        eventStreamController.add('event 2');
      });
      // subscription1 = eventStreamController.stream.listen((event) {
      //   print('listen 11: $event');
      // });
      // eventStreamController.add('event 2');
    });

    test('cancel all listen', () async {
      final eventStreamController = StreamController<String>.broadcast();
      var subscription1 = eventStreamController.stream.listen((event) {
        print('listen 1: $event');
      });
      subscription1.cancel();
      subscription1 = eventStreamController.stream.listen((event) {
        print('listen 11: $event');
      });
      subscription1.cancel();

      eventStreamController.add('event 1');
      await Future.delayed(Duration(seconds: 3), () {
        subscription1.cancel();
        subscription1.cancel();
        eventStreamController.add('event 2');
      });
      // subscription1 = eventStreamController.stream.listen((event) {
      //   print('listen 11: $event');
      // });
      // eventStreamController.add('event 2');
    });
  });

  test('stream controller cancel 1', () async {
    final eventStreamController = StreamController<String>.broadcast();

    var subscription1 = eventStreamController.stream.listen((event) {
      print('listen 1: $event');
    });
    subscription1 = eventStreamController.stream.listen((event) {
      print('listen 11: $event');
    });
    subscription1 = eventStreamController.stream.listen((event) {
      print('listen 111: $event');
    });
    // subscription1.onData(
    //   (data) {
    //     print('subscription1.onData: $data');
    //   },
    // );
    eventStreamController.add('event 1');
    // eventStreamController.add('event 2');

    subscription1.cancel();
    eventStreamController.add('event 3');
  });
}
