import 'dart:async';

import 'package:flutter/material.dart';

class ShapeButton extends StatefulWidget {
  final Widget titleWidget;
  final String? name;
  final ShapeBorder shape;
  final GestureTapCallback? onTap;
  final GestureLongPressCallback? onLongPress;

  const ShapeButton({
    super.key,
    required this.titleWidget,
    required this.onTap,
    required this.shape,
    this.name,
    this.onLongPress,
  });

  @override
  State<ShapeButton> createState() => _ShapeButtonState();
}

class _ShapeButtonState extends State<ShapeButton> {
  late Timer _timer;
  late Stopwatch _stopwatch;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: widget.shape,
      color: Colors.blue,
      elevation: 16,
      textStyle: TextStyle(color: Colors.white),
      child: InkWell(
        // splashFactory: InkRipple.splashFactory,
        splashColor: Colors.white,
        customBorder: widget.shape,
        onTap: () {
          print('${DateTime.now()} onTap');
          print(_stopwatch.elapsedMilliseconds);
          _stopwatch.stop();
          _timer.cancel();
          if (_stopwatch.elapsedMilliseconds < 200) {
            print('call onTap');
            // widget.onTap?.call();
          }
        },
        // NOTE: onLongPress 会导致在按下时，水波不会完全显示，且立马消失。
        // onLongPress: onLongPress,
        onTapDown: (details) async {
          print('${DateTime.now()} onTapDown');
          _stopwatch = Stopwatch()..start();
          _timer = Timer(
            Duration(milliseconds: 1000),
                () {
              // widget.onLongPress?.call();
              print('call onLongPress');
            },
          );
        },
        onTapCancel: () {
          // print('onTapCancel');
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              widget.titleWidget,
              SizedBox(height: 4),
              if (widget.name != null)
                Text(
                  widget.name!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                )
            ],
          ),
        ),
      ),
    );
  }
}
