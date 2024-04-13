import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  State<SliderDemo> createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0.0;

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
              value: _sliderValue,
              min: 0.0,
              max: 600.0,
              onChanged: (newValue) {
                setState(() {
                  _sliderValue = newValue;
                });
              },
              divisions: 600,
              label: _sliderValue.toStringAsFixed(0),
            ),
          ],
        ),
      ),
    );
  }
}
