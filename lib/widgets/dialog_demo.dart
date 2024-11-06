import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  const DialogDemo({super.key});

  @override
  State<DialogDemo> createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Dialog Title'),
                      content: const Text('This is a dialog.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Show Dialog'),
            ),
            ElevatedButton(
              onPressed: () async {
                final result = await catLoversDialog();
              },
              child: const Text('Show Dialog1'),
            ),
            ElevatedButton(
              onPressed: () async {
                DialogRoute? dialogRoute;
                dialogRoute = DialogRoute(
                    context: context,
                    builder: (_) => AlertDialog(
                          content: Text("Do you love dogs?"),
                          actions: [
                            TextButton(
                                child: Text("no",
                                    style: TextStyle(color: Colors.grey)),
                                onPressed: () {
                                  Navigator.pop(context, false);
                                }),
                            TextButton(
                                child: Text("yes!",
                                    style: TextStyle(color: Colors.blue)),
                                onPressed: () {
                                  catLoversDialog();
                                  // Navigator.pop(context, true);
                                  Navigator.of(context)
                                      .removeRoute(dialogRoute!);
                                })
                          ],
                        ),
                    barrierDismissible: false);

                Navigator.of(context).push(dialogRoute);

// close dialog
//                 Navigator.of(context).removeRoute(route);
              },
              child: const Text('Show Dialog Route'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DialogDemo1(),
                    ));
              },
              child: const Text('Dialog Demo1'),
            )
          ],
        ),
      ),
    );
  }

  Future<bool?> catLoversDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context1) => AlertDialog(
        title: const Text('Dialog Title'),
        content: Text("Do you love cats?"),
        actions: [
          TextButton(
              child: Text("no", style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.pop(context1, false);
              }),
          TextButton(
              child: Text("yes!", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                dogLoversDialog();
                Navigator.of(context1).pop();

                // Navigator.pop(context1, true);
              })
        ],
      ),
    );
  }

  Future<bool?> dogLoversDialog() {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Do you love dogs?"),
        actions: [
          TextButton(
              child: Text("no", style: TextStyle(color: Colors.grey)),
              onPressed: () {
                Navigator.pop(context, false);
              }),
          TextButton(
              child: Text("yes!", style: TextStyle(color: Colors.blue)),
              onPressed: () {
                catLoversDialog();
                // Navigator.pop(context, true);
              })
        ],
      ),
    );
  }
}

class DialogDemo1 extends StatefulWidget {
  const DialogDemo1({super.key});

  @override
  State<DialogDemo1> createState() => _DialogDemo1State();
}

class _DialogDemo1State extends State<DialogDemo1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                print('context.mounted ${context.mounted}');
                await Future.delayed(Duration(seconds: 3));
                print(context);
                print('context.mounted ${context.mounted}');
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Dialog Title'),
                      content: const Text('This is a dialog.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Show Dialog'),
            ),
          ],
        ),
      ),
    );
  }
}
