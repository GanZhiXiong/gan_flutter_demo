import 'dart:math';

import 'package:flutter/material.dart';

class WaterTank extends StatefulWidget {
  final double cornerRadius;

  const WaterTank({super.key, this.cornerRadius = 40.0}); // The radius of the tank's bottom corners

  @override
  _WaterTankState createState() => _WaterTankState();
}

class _WaterTankState extends State<WaterTank> with SingleTickerProviderStateMixin {
  double waterLevel = 0.5; // 初始水位
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: waterLevel).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void setWaterLevel(double level) {
    _animation = Tween<double>(begin: waterLevel, end: level).animate(_animationController);
    _animationController.forward(from: 0);
    setState(() {
      waterLevel = level;
    });
  }

  double calculateDistance(double height, double radius, double x1, double x2) {
    double y = height - radius;
    double distance = sqrt(pow((x2 - x1), 2) + pow(y, 2));
    return distance;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(widget.cornerRadius),
              bottomRight: Radius.circular(widget.cornerRadius),
            ),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: buildWater(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: 10,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
        Slider(
          value: waterLevel,
          min: 0,
          max: 1,
          onChanged: (value) {
            setWaterLevel(value);
          },
        ),
      ],
    );
  }

  AnimatedBuilder buildWater() {
    var width = 200.0;
    var height = _animation.value * 300;
    if (height < widget.cornerRadius) {
      double x = sqrt(pow(widget.cornerRadius, 2) - pow(widget.cornerRadius - height, 2));
      width = width - widget.cornerRadius * 2 + x * 2;
    }
    return AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Container(
                    // width: 200,
                    // height: _animation.value * 300,
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(widget.cornerRadius),
                        bottomRight: Radius.circular(widget.cornerRadius),
                      ),
                    ),
                  );
                },
              );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('水箱'),
      ),
      body: Center(
        child: WaterTank(),
      ),
    ),
  ));
}