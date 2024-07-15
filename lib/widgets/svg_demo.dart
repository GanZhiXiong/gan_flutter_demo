import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gan_flutter_demo/IconFontIcons.dart';

class SvgDemo extends StatefulWidget {
  const SvgDemo({super.key});

  @override
  State<SvgDemo> createState() => _SvgDemoState();
}

class _SvgDemoState extends State<SvgDemo> {
  @override
  Widget build(BuildContext context) {
    const size = 80.0;
    const color = Colors.green;
    return Scaffold(
      appBar: AppBar(title: const Text('Svg Demo')),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            const Column(
              children: [
                Text('MonoChrome IconFont Color Green'),
                Icon(
                  MonoChromeIconFont.iconA7617Mianxing,
                  size: size,
                  color: color,
                ),
                Icon(
                  MonoChromeIconFont.iconA7617Mianxing1,
                  size: size,
                  color: color,
                ),
                Icon(
                  MonoChromeIconFont.iconA7617Mianxing2,
                  size: size,
                  color: color,
                ),
                Icon(
                  MonoChromeIconFont.iconChapai,
                  size: size,
                  color: color,
                ),
                Icon(
                  MonoChromeIconFont.iconChekuguanmen,
                  size: size,
                  color: color,
                ),
                Icon(
                  MonoChromeIconFont.iconKaicheku,
                  size: size,
                  color: color,
                ),
                Icon(
                  MonoChromeIconFont.iconKaiguankongzhi,
                  size: size,
                  color: color,
                ),
                Icon(
                  MonoChromeIconFont.iconShuifa,
                  size: size,
                  color: color,
                ),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            const Column(
              children: [
                Text('MultiColour IconFont Color Green'),
                Icon(
                  MultiColourIconFont.iconA7617Mianxing,
                  size: size,
                  color: color,
                ),
                Icon(
                  MultiColourIconFont.iconA7617Mianxing1,
                  size: size,
                  color: color,
                ),
                Icon(
                  MultiColourIconFont.iconA7617Mianxing2,
                  size: size,
                  color: color,
                ),
                Icon(
                  MultiColourIconFont.iconChapai,
                  size: size,
                  color: color,
                ),
                Icon(
                  MultiColourIconFont.iconChekuguanmen,
                  size: size,
                  color: color,
                ),
                Icon(
                  MultiColourIconFont.iconKaicheku,
                  size: size,
                  color: color,
                ),
                Icon(
                  MultiColourIconFont.iconKaiguankongzhi,
                  size: size,
                  color: color,
                ),
                Icon(
                  MultiColourIconFont.iconShuifa,
                  size: size,
                  color: color,
                ),
              ],
            ),
            const SizedBox(
              width: 24,
            ),
            buildSvg(),
          ],
        ),
      ),
    );
  }

  Column buildSvg() {
    return Column(
      children: [
        Text('SVG'),
        SvgPicture.asset(
          'assets/images/monochrome.svg',
          height: 80,
        ),
        SvgPicture.asset(
          'assets/images/multicolour.svg',
          height: 80,
        ),
        SvgPicture.asset(
          'assets/images/monochrome.svg',
          height: 80,
          color: Colors.green,
        ),
        SvgPicture.asset(
          'assets/images/multicolour.svg',
          height: 80,
          color: Colors.green,
        ),
      ],
    );
  }
}
