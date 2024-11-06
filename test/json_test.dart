import 'package:flutter_test/flutter_test.dart';

import 'dart:convert';

T? asT<T>(dynamic value) {
  if (value is T) {
    return value;
  }
  return null;
}

class PulseMode {
  PulseMode({
    this.duration,
    this.enable,
  });

  factory PulseMode.fromJson(Map<String, dynamic> json) => PulseMode(
        duration: asT<int?>(json['duration']),
        enable: asT<bool?>(json['enable']),
      );

  int? duration;
  bool? enable;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'duration': duration,
        'enable': enable,
      };
}

void main() {
  test('json', () {

    Map<String, dynamic> json = {
      'duration': 1,
      'enable': true
    };

    print(json['a']);

    var p = PulseMode(enable: true, duration: 1);
    print(p);
    print(p.toString());
    print(p.toJson());

    p = PulseMode(enable: true);
    print(p);
    print(p.toString());
    print(p.toJson());

    p = PulseMode.fromJson(p.toJson());
    print(p);
    print(p.toString());
    print(p.toJson());

    Map<String, dynamic> obj1 = {'name': 'John', 'age': 30};
    Map<String, dynamic> obj2 = {
      'name': 'gan',
      'age': null,
      'email': 'john@example.com',
      'address': '123 Street'
    };

    obj1..addAll(obj2);

    print(obj1);
  });

  test('merge', () {
    var p = PulseMode(enable: true, duration: 1);
    var p1 = PulseMode(enable: false);


    // print(p);
    // print(p.toString());
    // print(p.toJson());
    //
    // var p1 = PulseMode(enable: false);
    // print(p);
    // print(p.toString());
    // print(p.toJson());
    //
    // p = PulseMode.fromJson(p.toJson());
    // print(p);
    // print(p.toString());
    // print(p.toJson());
    //
    // Map<String, dynamic> obj1 = {'name': 'John', 'age': 30};
    // Map<String, dynamic> obj2 = {
    //   'name': 'gan',
    //   'age': null,
    //   'email': 'john@example.com',
    //   'address': '123 Street'
    // };
    //
    // obj1..addAll(obj2);
    //
    // print(obj1);
  });
}
