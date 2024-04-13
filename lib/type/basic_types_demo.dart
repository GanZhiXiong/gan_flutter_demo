import 'package:flutter/material.dart';

class BasicTypesDemo extends StatefulWidget {
  const BasicTypesDemo({super.key});

  @override
  State<BasicTypesDemo> createState() => _BasicTypesDemoState();
}

class _BasicTypesDemoState extends State<BasicTypesDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Basic Types Demo'),
        ),
        body: Center(
          child: MyWidget(
            //Listening to the click and input events
            valueChanged: (val) {
              print('I am a valueChanged');
            },
            valueSetter: (value) {
              print('I am a valueSetter');
            },
            valueGetter: () {
              print('I am a valueGetter');
            },
          ),
        ));
  }
}

class MyWidget extends StatelessWidget {
  //Declare the callbacks
  final ValueGetter? valueGetter;
  final ValueSetter valueSetter;
  final ValueChanged<String?> valueChanged;

  MyWidget({
    required this.valueChanged,
    required this.valueGetter,
    required this.valueSetter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      //Sample usage of the callbacks
      TextField(
        onChanged: valueSetter,
      ),
      TextField(
        onChanged: valueChanged,
      ),
      ElevatedButton(onPressed: valueGetter, child: Text('Am a ValueGetterjkkkkjjjjj')),
    ]);
  }
}
