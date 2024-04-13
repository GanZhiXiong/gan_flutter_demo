// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class LongTextDemo extends StatefulWidget {
  const LongTextDemo({super.key});

  @override
  State<LongTextDemo> createState() => _LongTextDemoState();
}

class _LongTextDemoState extends State<LongTextDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Long Text Demo')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                  '12345678901234567890123456788888888888881234567890abcdeedhello'),
              Divider(),
              Row(
                children: [
                  Text(
                    '1',
                    style: TextStyle(fontSize: 38),
                  ),
                  Text(
                      '12345678901234567890123456788888888888881234567890abcdeedhello'),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    '2',
                    style: TextStyle(fontSize: 38),
                  ),
                  Expanded(
                    child: Text(
                        '12345678901234567890123456788888888888881234567890abcdeedhello'),
                  ),
                ],
              ),
              Divider(),
              FittedBoxDemo(),
              Divider(),
              Row(
                children: [
                  Text(
                    '4',
                    style: TextStyle(fontSize: 38),
                  ),
                  Expanded(
                    child: FittedBox(
                      child: Text(
                        '12345678901234567890123456788888888888881234567890abcdeedhello',
                      ),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    '5',
                    style: TextStyle(fontSize: 38),
                  ),
                  Expanded(
                    child: Text(
                        '12345678901234567890123456788888888888881234567890abcdeedhello'),
                  ),
                  Expanded(
                    child: Text(
                      '12345678901234567890123456788888888888881234567890abcdeedhello',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    '6',
                    style: TextStyle(fontSize: 38),
                  ),
                  Expanded(
                    child: Text(
                        '12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg'),
                  ),
                  Text(
                      'This is considered an error condition because it indicates that ',
                      style: TextStyle(color: Colors.red)),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    '7',
                    style: TextStyle(fontSize: 38),
                  ),
                  Expanded(
                    child: Text(
                        '12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg'),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 200),
                    child: Text(
                      '12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg88',
                      style: TextStyle(color: Colors.red),
                      // maxLines: 1,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    '8',
                    style: TextStyle(fontSize: 38),
                  ),
                  Expanded(
                    child: Text(
                        '12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg'),
                  ),
                  Expanded(
                    child: Text(
                      '12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    '9',
                    style: TextStyle(fontSize: 38),
                  ),
                  Flexible(
                    child: Text(
                        '12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg'),
                  ),
                  Flexible(
                    child: Text(
                      '12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg12345678901234567890123456788888888888881234567890abcdeedhelloabcdefg',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    '10',
                    style: TextStyle(fontSize: 38),
                  ),
                  Flexible(
                    child: Text('123'),
                  ),
                  Flexible(
                    child: Text(
                      'You can use the length of the strings to split the area available to each one using calculated flex values in Flexible. The result will not always be optimal with non monospaced fonts, but somehow you have to assign how many space should the texts occupy. You could use Expanded to fill the remaining available space, but it only works if you have a fixed width item and use Expanded on the ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: [
                  Text(
                    '11',
                    style: TextStyle(fontSize: 38),
                  ),
                  Flexible(
                    flex: 0,
                    child: Text(
                      '12312345678901234',
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Expanded(
                    // fit: FlexFit.s,
                    child: Text(
                      'You can use the length of the strings to split the area available to each one using calculated flex values in Flexible. The result will not always be optimal with non monospaced fonts, but somehow you have to assign how many space should the texts occupy. You could use Expanded to fill the remaining available space, but it only works if you have a fixed width item and use Expanded on the ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Text(
                'Flexible 1',
                style: TextStyle(fontSize: 38),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(color: Colors.blue),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(color: Colors.green),
                  ),
                ],
              ),
              Text(
                'Flexible 2',
                style: TextStyle(fontSize: 38),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      'You can use the length of the strings to split the area available to each one using calculated flex values in Flexible. The result will not always be optimal with non monospaced fonts, but somehow you have to assign how many space should the texts occupy. You could use Expanded to fill the remaining available space, but it only works if you have a fixed width item and use Expanded on the ',
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      'You can use the length of the strings to split the area available to each one using calculated flex values in Flexible. The result will not always be optimal with non monospaced fonts, but somehow you have to assign how many space should the texts occupy. You could use Expanded to fill the remaining available space, but it only works if you have a fixed width item and use Expanded on the ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Text(
                'Flexible 3',
                style: TextStyle(fontSize: 38),
              ),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Text(
                      '123',
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Text(
                      'You can use the length of the strings to split the area available to each one using calculated flex values in Flexible. The result will not always be optimal with non monospaced fonts, but somehow you have to assign how many space should the texts occupy. You could use Expanded to fill the remaining available space, but it only works if you have a fixed width item and use Expanded on the ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Text(
                'Flexible 3-1',
                style: TextStyle(fontSize: 38),
              ),
              Row(
                children: [
                  Flexible(
                    child: Text(
                      '123',
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'You can use the length of the strings to split the area available to each one using calculated flex values in Flexible. The result will not always be optimal with non monospaced fonts, but somehow you have to assign how many space should the texts occupy. You could use Expanded to fill the remaining available space, but it only works if you have a fixed width item and use Expanded on the ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Text(
                'Flexible 3-2',
                style: TextStyle(fontSize: 38),
              ),
              Row(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      '123',
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Text(
                      'You can use the length of the strings to split the area available to each one using calculated flex values in Flexible. The result will not always be optimal with non monospaced fonts, but somehow you have to assign how many space should the texts occupy. You could use Expanded to fill the remaining available space, but it only works if you have a fixed width item and use Expanded on the ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Text(
                'Flexible 4',
                style: TextStyle(fontSize: 38),
              ),
              Row(
                children: [
                  Text(
                    '123',
                  ),
                  Flexible(
                    // fit: FlexFit.loose,
                    child: Text(
                      'You can use the length of the strings to split the area available to each one using calculated flex values in Flexible. The result will not always be optimal with non monospaced fonts, but somehow you have to assign how many space should the texts occupy. You could use Expanded to fill the remaining available space, but it only works if you have a fixed width item and use Expanded on the ',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ],
              ),
              Text(
                'Flexible 5',
                style: TextStyle(fontSize: 38),
              ),
              Row(
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      color: Colors.teal,
                      child: Text(
                        'Container Text ',
                      )),
                  Flexible(
                    child: Container(
                        color: Colors.blue,
                        child: Text(
                            ' Text.Flexible Text.Flexible Text.Flexible.')),
                  ),
                  Flexible(
                    child: Container(
                        color: Colors.yellow, child: Text('Flexible Text.')),
                  ),
                  Flexible(
                    child: Container(
                        color: Colors.lightGreen, child: Text('Flexible.')),
                  ),
                ],
              ),
              Divider(),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on, color: Colors.grey[700]),
                  Container(width: 8),
                  Flexible(
                    child: Text(
                        '12345678901234567890123456788888888888881234567890',
                        overflow: TextOverflow.ellipsis, //this one now works :)
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                  Flexible(
                    child: Text('123456789',
                        overflow: TextOverflow.ellipsis, //this one now works :)
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
              buildRow(),
              buildRow2(),
              buildRow1(),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Flexible(
                    child: Text(
                        'This is considered an error condition because it indicates that there is content that cannot be seen. If the content is legitimately bigger than the available space, consider clipping it with a ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex, like a ListView.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left)),
                Flexible(
                    child: Text(
                        'This is considered an error condition because it indicates that there is content that cannot be seen. If the content is legitimately bigger than the available space, consider clipping it with a ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex, like a ListView.',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left)),
              ]),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Flexible(
                    child: Text('This is considered an error condition because',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left)),
                Flexible(
                    child: Text('This is',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left)),
              ]),
              Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Flexible(
                    flex:
                        'This is considered an error condition because'.length,
                    child: Text(
                        'This is considered an error condition because 123432222233333888888',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left)),
                Flexible(
                    flex:
                        'This is This is considered an error condition because it indicates that there is content that cannot be seen.'
                            .length,
                    child: Text(
                        'This is This is considered an error condition because it indicates that there is content that cannot be see',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left)),
              ]),
              Row(children: [
                Text(
                    'This is considered an error condition because 123432222233333888888',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left),
                Text(
                    'This is This is considered an error condition because it indicates that there is content that cannot be see',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.left),
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("1Prefix"),
                  Expanded(
                    child: Text(
                        'This is This is considered an error condition because it indicates that there is content that cannot be see', style: TextStyle(color: Colors.red),),
                  ),
                  Text("TrailingIcon"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("2Prefix"),
                  Flexible(
                    child: Text(
                        'This is This is considered an error condition because it indicates that there is content that cannot be see', style: TextStyle(color: Colors.red),),
                  ),
                  Text("TrailingIcon"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Prefix"),
                  Expanded(
                    child: Container(
                      color: Colors.deepOrange,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Very ",
                              maxLines: 1,
                            ),
                          ),
                          Icon(
                            Icons.tag_sharp,
                          )
                        ],
                      ),
                    ),
                  ),
                  Text("TrailingIcon"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Prefix"),
                  Expanded(
                    child: Container(
                      color: Colors.deepOrange,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Very This is considered an error condition because it indicates that there is content that cannot be seen. If the content is legitimately bigger than the available space, consider clipping it with a ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex, like a ListView.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.tag_sharp,
                          )
                        ],
                      ),
                    ),
                  ),
                  Text("TrailingIcon"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Prefix"),
                  Expanded(
                    child: Container(
                      color: Colors.deepOrange,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              "Very ",
                              maxLines: 1,
                            ),
                          ),
                          Icon(
                            Icons.tag_sharp,
                          )
                        ],
                      ),
                    ),
                  ),
                  Text("TrailingIcon"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Prefix"),
                  Expanded(
                    child: Container(
                      color: Colors.deepOrange,
                      child: Row(
                        children: [
                          Flexible(
                            child: Text(
                              "Very This is considered an error condition because it indicates that there is content that cannot be seen. If the content is legitimately bigger than the available space, consider clipping it with a ClipRect widget before putting it in the flex, or using a scrollable container rather than a Flex, like a ListView.",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.tag_sharp,
                          )
                        ],
                      ),
                    ),
                  ),
                  Text("TrailingIcon"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildRow2() {
    return Row(
      children: [
        // Text('123'),
        Text('1234567890123456789012345678888888888888'),
        Flexible(
          child: Container(
            height: 48,
            child: Column(
              children: [
                FittedBox(
                  child: Text(
                    "Now that you've finished a plan, it's essential to measure your growth. We've included assessments and activities to do just that.",
                    style: TextStyle(
                      color: Color(0x80484848),
                      fontWeight: FontWeight.w400,
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row buildRow1() {
    return Row(
      children: [
        ClipRect(
          child: Container(
            height: 11,
            width: 11,
            color: Colors.red,
          ),
        ),
        Text('1234567890123456789012345678888888888888'),
        Expanded(
          child: Text(
            "Now that you've finished a plan, it's essential to measure your growth. We've included assessments and activities to do just that.",
            style: TextStyle(
              overflow: TextOverflow.visible,
              color: Color(0x80484848),
              fontWeight: FontWeight.w400,
              // fontSize: 30,
            ),
          ),
        ),
      ],
    );
  }

  Row buildRow() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            'Embassy of the United States of America12345678901234567890'
                .replaceAll(RegExp(' '), '\u00A0'),
            style: TextStyle(
                color: Color(0xFF202020),
                fontSize: 14,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis),
          ),
        ),
        Text('-'),
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            'Holiday Inn'.replaceAll(RegExp(' '), '\u00A0'),
            style: TextStyle(
                color: Colors.red,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                overflow: TextOverflow.ellipsis),
          ),
        ),
      ],
    );
  }
}

class FittedBoxDemo extends StatelessWidget {
  const FittedBoxDemo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              '3',
              style: TextStyle(fontSize: 28),
            ),
            Expanded(
              child: FittedBox(
                child: Text(
                    '12345678901234567890123456788888888888881234567890abcdeedhello'),
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Text(
              '3-1',
              style: TextStyle(fontSize: 28),
            ),
            FittedBox(
              child: Text(
                'xx' * 30,
              ),
            ),
          ],
        ),
        wRow(' 90000000000000123 '),
        FittedBox(child: wRow(' 90000000000000123 ')),
        wRow(' 800 '),
        FittedBox(child: wRow(' 800 ')),
        wRow(' 90000000000000123 '),
        SingleLineFittedBox(child: wRow(' 90000000000000123 ')),
        SingleLineFittedBox1(child: wRow(' 90000000000000123 ')),
        wRow(' 800 '),
        SingleLineFittedBox(child: wRow(' 800 ')),
        SingleLineFittedBox(
            child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '1234567890',
                style: TextStyle(fontSize: 44),
              ),
              // Divider(height: 10,thickness: 10,),
              VerticalDivider(
                width: 20,
                thickness: 2,
                color: Colors.black,
              ),
              Text('123', style: TextStyle(fontSize: 44))
            ],
          ),
        )),
        IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '1234567890abcd',
                    // '123',
                    style: TextStyle(fontSize: 44),
                    softWrap: false,
                  ),
                ),
              ),
              // Divider(height: 10,thickness: 10,),
              VerticalDivider(
                width: 20,
                thickness: 2,
                color: Colors.black,
              ),
              Expanded(
                  child: FittedBox(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        // '1234567890',
                        '123',
                        style: TextStyle(fontSize: 44),
                        softWrap: false,
                      )))
            ],
          ),
        )
      ],
    );
  }

  // 直接使用Row
  Widget wRow(String text) {
    Widget child = Text(text);
    child = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [child, child, child],
    );
    return child;
  }
}

class SingleLineFittedBox extends StatelessWidget {
  const SingleLineFittedBox({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
                //让 maxWidth 使用屏幕宽度
                maxWidth: constraints.maxWidth),
            child: child,
          ),
        );
      },
    );
  }
}

class SingleLineFittedBox1 extends StatelessWidget {
  const SingleLineFittedBox1({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
          child: ConstrainedBox(
            constraints: constraints.copyWith(
                //让 maxWidth 使用屏幕宽度
                minWidth: constraints.maxWidth,
                maxWidth: double.infinity),
            child: child,
          ),
        );
      },
    );
  }
}
