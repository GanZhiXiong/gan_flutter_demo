import 'package:flutter/material.dart';

class TTest<T> extends StatefulWidget {
  final Widget Function(T? data) builder;

  const TTest({super.key, required this.builder});

  @override
  State<TTest> createState() => _TTestState<T>();
}

class _TTestState<T> extends State<TTest<T>> {
  T? data;

  @override
  void initState() {
    super.initState();
    this.loadData().then(( value) {
      print('load data success');
      setState(() {
        data = value;
      });
    });
  }

  Future<T?> loadData() {
    return Future.delayed(Duration(seconds: 1), () {
      // return T;
      // return null;
      return ['1', '2'] as T;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(child: widget.builder(data),);
  }
}
