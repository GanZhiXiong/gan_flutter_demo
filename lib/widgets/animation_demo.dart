import 'package:flutter/material.dart';

/// Flutter code sample for [TweenAnimationBuilder].

void main() => runApp(const TweenAnimationBuilderExampleApp());

class TweenAnimationBuilderExampleApp extends StatefulWidget {
  const TweenAnimationBuilderExampleApp({super.key});

  @override
  State<TweenAnimationBuilderExampleApp> createState() =>
      _TweenAnimationBuilderExampleAppState();
}

class _TweenAnimationBuilderExampleAppState
    extends State<TweenAnimationBuilderExampleApp> {
  @override
  Widget build(BuildContext context) {
    print('_TweenAnimationBuilderExampleAppState.build');
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TweenAnimationBuilder Sample'),
        ),
        body: Center(
          child: Column(
            children: [
              Column(
                children: [
                  TextButton(
                      onPressed: () {
                        print('setState');
                        setState(() {});
                      },
                      child: Text('setState')),
                  TweenAnimationBuilderExample(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TweenAnimationBuilderExample extends StatefulWidget {
  const TweenAnimationBuilderExample({super.key});

  @override
  State<TweenAnimationBuilderExample> createState() =>
      _TweenAnimationBuilderExampleState();
}

class _TweenAnimationBuilderExampleState
    extends State<TweenAnimationBuilderExample> {
  double _targetValue = 24.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('initState');
  }

  @override
  Widget build(BuildContext context) {
    print('_TweenAnimationBuilderExampleState.build');
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: _targetValue),
      duration: const Duration(seconds: 1),
      builder: (BuildContext context, double size, Widget? child) {
        return IconButton(
          iconSize: size,
          color: Colors.blue,
          icon: child!,
          onPressed: () {
            setState(() {
              _targetValue = _targetValue == 24.0 ? 48.0 : 24.0;
            });
          },
        );
      },
      child: const Icon(Icons.aspect_ratio),
    );
  }
}
