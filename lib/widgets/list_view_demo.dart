import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({super.key});

  @override
  State<ListViewDemo> createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView Demo'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets.all(16),
          color: Colors.blue,
          child: ListView.separated(
            // ListView 底部有默认的 Padding
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            // 禁用滚动手势
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: Colors.grey),
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('Item ${index + 1}'),
              );
            },
          ),
        ),
      ),
    );
  }
}
