import 'package:flutter/material.dart';

class ScaleUpdateDemo extends StatefulWidget {
  const ScaleUpdateDemo({super.key});

  @override
  State<ScaleUpdateDemo> createState() => _ScaleUpdateDemoState();
}

class _ScaleUpdateDemoState extends State<ScaleUpdateDemo> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return ZoomAndPanDemo();
    return Scaffold(
      appBar: AppBar(
        title: Text('Touch Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            GestureDetector(
              onScaleUpdate: (ScaleUpdateDetails details) {
                // 处理缩放事件
                print('Scale: ${details.scale}');
              },
              child: FlutterLogo(size: 100.0),
            ),
            ZoomAndPanDemo()
          ],
        ),
      ),
    );
  }
}

class ZoomAndPanDemo extends StatefulWidget {
  @override
  _ZoomAndPanDemoState createState() => _ZoomAndPanDemoState();
}

class _ZoomAndPanDemoState extends State<ZoomAndPanDemo> {
  Offset _offset = Offset.zero;
  Offset _initialFocalPoint = Offset.zero;
  Offset _sessionOffset = Offset.zero;

  double _scale = 1.0;
  double _initialScale = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (details) {
        _initialFocalPoint = details.focalPoint;
        _initialScale = _scale;
      },
      onScaleUpdate: (details) {
        setState(() {
          _sessionOffset = details.focalPoint - _initialFocalPoint;
          _scale = _initialScale * details.scale;
        });
      },
      onScaleEnd: (details) {
        setState(() {
          _offset += _sessionOffset;
          _sessionOffset = Offset.zero;
        });
      },
      child: Transform.translate(
        offset: _offset + _sessionOffset,
        child: Transform.scale(
          scale: _scale,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}