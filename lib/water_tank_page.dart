import 'package:flutter/material.dart';
import 'package:gan_flutter_demo/water_tank.dart';
import 'package:gan_flutter_demo/water_tank1.dart';
import 'package:gan_flutter_demo/water_tank_with_ruler.dart';
import 'adjustable_rounded_rectangle.dart';

class WaterTankPage extends StatefulWidget {
  const WaterTankPage({super.key});

  @override
  State<WaterTankPage> createState() => _WaterTankPageState();
}

class _WaterTankPageState extends State<WaterTankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Water Tank Page'),
        ),
        // body: WaterTank(),
        // body: WaterTank1(
        //   height: 200,
        // ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            SizedBox(height: 16),
            AdjustableRoundedRectangle(),
            WaterTank(),
            Divider(),
            WaterTank1(
              height: 200,
            ),
            Divider(),
            WaterTankWithRuler(),
          ],
        ))));
  }
}
