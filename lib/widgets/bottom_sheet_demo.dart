import 'package:flutter/material.dart';
import 'package:gan_flutter_demo/widgets/my_draggable_sheet.dart';

class BottomSheetDemo extends StatefulWidget {
  const BottomSheetDemo({super.key});

  @override
  State<BottomSheetDemo> createState() => _BottomSheetDemoState();
}

class _BottomSheetDemoState extends State<BottomSheetDemo> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BottomSheetDemo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 200,
                          color: Colors.blue,
                          child: const Center(
                            child: Text('BottomSheetDemo'),
                          ),
                        );
                      });
                },
                child: const Text('Container')),
            Switch(
              value: _switchValue,
              onChanged: (bool newValue) {
                setState(() {
                  _switchValue = newValue;
                });
              },
            ),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return SizedBox(
                          height: 200,
                          width: 200,
                          child: Switch(
                            value: _switchValue,
                            onChanged: (bool newValue) {
                              setState(() {
                                _switchValue = newValue;
                              });
                            },
                          ),
                        );
                      });
                },
                child: const Text('Switch not in StatefulBuilder')),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return switch2();
                          },
                        );
                      });
                },
                child: const Text('Switch in StatefulBuilder and Method')),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        print('builder');
                        _switchValue = false;
                        return buildStatefulBuilder();
                      });
                },
                child: const Text(
                    'Switch and StatefulBuilder in the Same Method ')),
            TextButton(
                onPressed: () {
                  print(_switchValue);
                },
                child: const Text('Print _switchValue (不要在 showModalBottomSheet 的 builder 中初始化，因为在下滑关闭或没有关闭的时候，会调用 2 次 builder)')),
            TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      context: context,
                      // 不设置则高度只有四分之一屏高
                      isScrollControlled: true,
                      builder: (context) => DraggableScrollableSheet(
                          maxChildSize: .5,
                          initialChildSize: .5,
                          // 去掉下滑到四分之一屏时，动画停顿一下
                          minChildSize: 0,
                          expand: false,
                          builder: (context, scrollController) {
                            return ListView.separated(
                              controller: scrollController,
                              itemCount: 100,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  title: Text('Item ${index + 1}'),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider();
                              },
                            );
                          }));
                },
                child: const Text('Scroll Bottom Sheet')),
            // MyDraggableSheet()
          ],
        ),
      ),
    );
  }

  StatefulBuilder buildStatefulBuilder() {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          height: 300,
          child: Center(
            child: Column(
              children: [
                Switch(
                  value: _switchValue,
                  onChanged: (bool newValue) {
                    // 仅能更新该 Switch
                    setState(() {
                      _switchValue = newValue;
                    });
                    // 仅能更新该 showModalBottomSheet 所属的 Widget。
                    this.setState(() {
                      _switchValue = newValue;
                    });
                  },
                ),
                buildCheckbox(setState),
              ],
            ),
          ),
        );
      },
    );
  }

  Checkbox buildCheckbox(StateSetter setState) {
    return Checkbox(
        value: _switchValue,
        activeColor: Colors.green,
        onChanged: (newValue) {
          if (newValue == null) {
            return;
          }
          // 仅能更新该 Switch
          setState(() {
            _switchValue = newValue;
          });
          // 仅能更新该 showModalBottomSheet 所属的 Widget。
          this.setState(() {
            _switchValue = newValue;
          });
        });
  }

  Widget switch2() {
    return Container(
      height: 300,
      child: ListView(
        children: [
          Switch(
            value: _switchValue,
            onChanged: (bool newValue) {
              // 仅能更新该 Switch
              setState(() {
                _switchValue = newValue;
              });
              // 仅能更新该 showModalBottomSheet 所属的 Widget。
              this.setState(() {
                _switchValue = newValue;
              });
            },
          ),
          Checkbox(
              value: _switchValue,
              activeColor: Colors.green,
              onChanged: (newValue) {
                if (newValue == null) {
                  return;
                }
                // 仅能更新该 Switch
                setState(() {
                  _switchValue = newValue;
                });
                // 仅能更新该 showModalBottomSheet 所属的 Widget。
                this.setState(() {
                  _switchValue = newValue;
                });
              }),
        ],
      ),
    );
  }
}
