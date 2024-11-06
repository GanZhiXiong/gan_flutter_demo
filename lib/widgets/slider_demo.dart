import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0.0;
  final List<double> values = [0.5, 1.0, 2.0, 3.0, 4.0, 5.0, 10.0, 15.0];
  int selectedIndex = 0;
  var _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Slider Value: ${_sliderValue.toStringAsFixed(0)}',
              style: TextStyle(fontSize: 20),
            ),
            Slider(
              value: selectedIndex.toDouble(),
              min: 0,
              max: values.length - 1,
              divisions: values.length - 1,
              label: values[selectedIndex].toString(),
              onChanged: (double value) {
                setState(() {
                  selectedIndex = value.toInt();
                });
              },
            ),
            Slider(
              value: _sliderValue,
              min:  0,
              max: 10,
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
              },
              divisions: 10,
              // label: _sliderValue.toStringAsFixed(0),
              label: _sliderValue.toString(),
            ),
            Switch(
              value: _switchValue,
              onChanged: (bool newValue) {
                setState(() {
                  _switchValue = newValue;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
