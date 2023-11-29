import 'package:flutter/material.dart';

class WaterTank1 extends StatefulWidget {
  final double height; // 水箱的高度

  const WaterTank1({required this.height});

  @override
  _WaterTankState1 createState() => _WaterTankState1();
}

class _WaterTankState1 extends State<WaterTank1> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _animation = Tween<double>(begin: 0, end: widget.height).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100, // 水箱的宽度
          height: widget.height, // 水箱的高度
          decoration: BoxDecoration(
            color: Colors.blue, // 水箱的颜色
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), // 左上角圆角
              topRight: Radius.circular(10), // 右上角圆角
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 10, // 绳子的宽度
            height: widget.height, // 绳子的高度
            color: Colors.black, // 绳子的颜色
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          child: Container(
            width: 50, // 尺子的宽度
            height: widget.height, // 尺子的高度
            color: Colors.white, // 尺子的颜色
            child: Column(
              children: List.generate(
                widget.height ~/ 10, // 根据高度计算刻度数量
                    (index) {
                  return Container(
                    width: 50,
                    height: 10,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey, // 刻度线的颜色
                          width: 1.0, // 刻度线的宽度
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}