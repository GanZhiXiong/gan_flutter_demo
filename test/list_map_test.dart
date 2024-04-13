import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  // Factory Person.clone() => Person(name, age); // 工厂构造函数

  factory Person.clone(Person source) {
    return Person(source.name, source.age);
  }

  Person.guest()
      : this.name = 'guest',
        this.age = 0;

  @override
  String toString() {
    return 'Person: name=$name, age=$age';
  }

  Person.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  Map<String, dynamic> toJson() => {'name': name, 'age': age};
}

void main() {
  test('addAll', () {
    Map w = {'4': 3};
    print(jsonEncode(w));

    Map a = {'a': 1, 'b': 2};
    print(a);
    var b = {'a': 2, 'b': 2};
    a.addAll(b);
    print(a);
    Map c = {
      'a': {'a1': 11}
    };

    a.addAll(c);
    print(a);
    a['a'].addAll({'a1': 22});
    print(a);

    a['a'].addAll({'a1': 22});
    print(a);

    a['a'].addAll(1);
    print(a);
  });

  test("List 复制不可变元素", () {
    var myList = [1, 2, 3];
    print('my $myList');

    var yourList = myList;
    yourList.remove(1);
    print('my $myList');
    print('your $yourList');

    print('---------------');

    myList = [1, 2, 3];
    var heList = myList.toList();
    heList.remove(1);
    print('my $myList');
    print('your $yourList');
    print('he $heList');

    print('---------------');

    myList = [1, 2, 3];
    heList = [...myList];
    heList.remove(1);
    print('my $myList');
    print('your $yourList');
    print('he $heList');
  });

  List<List<int>> deepCopy(List<List<int>> source) {
    return source.map((e) => e.toList()).toList();
  }

  test('List 复制可变元素', () {
    var myList = [
      [1],
      [2],
      [3]
    ];
    var yourList = myList.toList();
    yourList.removeAt(0);
    print('my $myList');
    print('your $yourList');

    print('列表内的列表元素是可变的，复制前后的可变元素的引用是同一个');
    yourList.first.first = 11;
    print('my $myList');
    print('your $yourList');

    print('因为深拷贝高度依赖于数据的结构，因此 Dart 没有提供深拷贝。那么如何实现深拷贝呢？');
    print('方法一：使用 const 修饰为不可变对象，但修改会在运行时报错');
    myList = [
      const [1],
      const [2],
      const [3]
    ];
    yourList = myList.toList();
    // Unsupported operation: Cannot modify an unmodifiable list
    // yourList.first.first = 11;
    print('my $myList');
    print('your $yourList');

    print('方法二：map');
    myList = [
      [1],
      [2],
      [3]
    ];
    yourList = deepCopy(myList);
    yourList.first.first = 11;
    print('my $myList');
    print('your $yourList');

    print('方法三：自定义 clone 方法');
    var myPersonList = [
      Person('a', 19),
      Person('b', 20),
    ];
    var yourPersonList = myPersonList.map((e) => Person.clone(e)).toList();
    yourPersonList.removeAt(0);
    print('my $myPersonList');
    print('your $yourPersonList');
    yourPersonList.first.age = 22;
    print('my $myPersonList');
    print('your $yourPersonList');

    print('Serializing and Deserializing');
    var jsonEncode2 = jsonEncode(myPersonList.first);
    print(jsonEncode2);
    var person = jsonDecode(jsonEncode2);
    print('person $person');
    var hePersonList = jsonDecode(jsonEncode(myPersonList));
    hePersonList.first.age = 22;
    print('my $myPersonList');
    print('he $hePersonList');
  });

  test('map copy', () {
    var myMap = {
      'a': 1,
      'b': {'bb': 2},
      'c': 3
    }; // 创建一个 Map 对象
    // var yourMap = myMap.map((key, value) => MapEntry(key, value));
    var yourMap = {...myMap};
    yourMap.remove('a');
    print('my $myMap');
    print('your $yourMap');

    yourMap['b'] = 22;
    print('my $myMap');
    print('your $yourMap');

    Map? a;
    var b = {...?a};
    print(b);
  });

  // https://stackoverflow.com/questions/50320220/in-dart-whats-the-difference-between-list-from-and-of-and-between-map-from-a
  test('from of test', () {
    // type 'int' is not a subtype of type 'String'
    // List<String> foo = new List.from(<int>[1, 2, 3]); // okay until runtime.
    // The argument type 'List<int>' can't be assigned to the parameter type 'Iterable<String>'. (Documentation)
    // List<String> bar = new List.of(<int>[1, 2, 3]); // analysis error

    var ints =
        List<int>.from(<num>[0, 1]); // Good as all elements are of type `int`
    // var ints1 = List<int>.from(<num>[0, 1.5]); // Bad as some elements are of type `double`

    // var ints2 = List<num>.of(<int>[0, 1]); // Good as all elements are of type `int`

    num a = 1;
    // int b = a;

    // var ints21 = List<int>.of(<num>[0, 1]); // Good as all elements are of type `int`
    // var ints13 = List<int>.of(<num>[0, 1.5]); // Bad as some elements are of type `double`

    List<String> foo = new List.from(<int>[1, 2, 3]); // okay until runtime.

    var foo1 = new List.from(<int>[1, 2, 3]); // List<dynamic>
    print(foo1.runtimeType);
    print(foo1);

    var bar1 = new List.of(<int>[1, 2, 3]); // List<int>
    print(bar1.runtimeType);
    print(bar1);
  });
}
