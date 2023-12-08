import 'package:flutter/material.dart';

class WidgetA extends StatelessWidget {
  String text;
  final Color color;

  WidgetA({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(text, style: TextStyle(color: color)),
          WidgetB(widgetA: this)
        ],
      ),
    );
  }
}

class WidgetB extends StatefulWidget {
  final WidgetA widgetA;

  const WidgetB({required this.widgetA});

  @override
  State<WidgetB> createState() => _WidgetBState();
}

class _WidgetBState extends State<WidgetB> {
  late WidgetA a;

  @override
  void initState() {
    super.initState();

    a = widget.widgetA;
  }


  @override
  Widget build(BuildContext context) {
    // a.text = 'Hello, WidgetB!';
    widget.widgetA.text = 'Hello, WidgetB!!!';
    return Text(widget.widgetA.text, style: TextStyle(color: widget.widgetA.color));
  }
}

class WidgetC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WidgetA(
        text: 'Hello, WidgetA!',
        color: Colors.blue,
      ),
    );
  }
}
