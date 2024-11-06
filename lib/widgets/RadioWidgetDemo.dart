import 'package:flutter/material.dart';

class User {
  int userId;
  String firstName;
  String lastName;

  User({required this.userId, required this.firstName, required this.lastName});

  static List<User> getUsers() {
    return <User>[
      User(userId: 1, firstName: "Aaron", lastName: "Jackson"),
      User(userId: 2, firstName: "Ben", lastName: "John"),
      User(userId: 3, firstName: "Carrie", lastName: "Brown"),
      User(userId: 4, firstName: "Deep", lastName: "Sen"),
      User(userId: 5, firstName: "Emily", lastName: "Jane"),
    ];
  }
}

class AttributeWraper<T> {
  T val;
  String desc;
  String? icon;

  AttributeWraper({required this.val, required this.desc, this.icon});

  static List<AttributeWraper<int>> getAttributes() => [
        AttributeWraper(val: 1, desc: "One"),
        AttributeWraper(val: 2, desc: "Two")
      ];
// @override
// bool equal(Equalable? value) {
//   if (value is AttributeWraper<T>) {
//     return value.val == val;
//   }
//   return false;
// }
}

class AttributeWraper1 {
  int val;
  String desc;
  String? icon;

  AttributeWraper1({required this.val, required this.desc, this.icon});

  static List<AttributeWraper1> getAttributes() => [
        AttributeWraper1(val: 1, desc: "One"),
        AttributeWraper1(val: 2, desc: "Two")
      ];
// @override
// bool equal(Equalable? value) {
//   if (value is AttributeWraper<T>) {
//     return value.val == val;
//   }
//   return false;
// }
}

class RadioWidgetDemo extends StatefulWidget {
  RadioWidgetDemo() : super();
  final String title = "Radio Widget Demo";

  @override
  RadioWidgetDemoState createState() => RadioWidgetDemoState();
}

class RadioWidgetDemoState extends State<RadioWidgetDemo> {
  //
  late List<User> users;
  User? selectedUser;
  int? selectedRadio;
  int? selectedRadioTile;
  late List<AttributeWraper<int>> attributes;
  AttributeWraper? selectedAttribute;
  AttributeWraper1? selectedAttribute1;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
    selectedRadioTile = 0;
    users = User.getUsers();
    attributes = AttributeWraper.getAttributes();
  }

  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  setSelectedRadioTile(int val) {
    setState(() {
      selectedRadioTile = val;
    });
  }

  setSelectedUser(User user) {
    setState(() {
      selectedUser = user;
    });
  }

  List<Widget> createRadioListUsers() {
    List<Widget> widgets = [];
    for (User user in users) {
      widgets.add(
        RadioListTile(
          value: user,
          groupValue: selectedUser,
          title: Text(user.firstName),
          subtitle: Text(user.lastName),
          onChanged: (currentUser) {
            print("Current User ${currentUser?.firstName}");
            setSelectedUser(currentUser!);
          },
          // selected: selectedUser == user,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
  }

  List<Widget> createRadioListAttributes() {
    List<Widget> widgets = [];
    for (AttributeWraper<int> attribute in attributes) {
      widgets.add(
        RadioListTile(
          value: attribute,
          groupValue: selectedAttribute,
          title: Text(attribute.desc),
          subtitle: Text(attribute.val.toString()),
          onChanged: (currentAttribute) {
            // print("Current User ${currentUser?.firstName}");
            // setSelectedUser(currentUser!);
            print(currentAttribute == selectedAttribute);
            print(currentAttribute?.val);
            print(selectedAttribute?.val);
            setState(() {
              selectedAttribute = currentAttribute;
            });
          },
          selected: selectedAttribute == attribute,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
  }

  List<Widget> createRadioListAttribute1s() {
    List<Widget> widgets = [];
    for (AttributeWraper1 attribute in AttributeWraper1.getAttributes()) {
      widgets.add(
        RadioListTile(
          value: attribute,
          groupValue: selectedAttribute1,
          title: Text(attribute.desc),
          subtitle: Text(attribute.val.toString()),
          onChanged: (currentAttribute) {
            // print("Current User ${currentUser?.firstName}");
            // setSelectedUser(currentUser!);
            print(currentAttribute == selectedAttribute1);
            print(currentAttribute?.val);
            print(selectedAttribute1?.val);
            setState(() {
              selectedAttribute1 = currentAttribute;
            });
          },
          selected: selectedAttribute == attribute,
          activeColor: Colors.green,
        ),
      );
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text("USERS"),
          ),
          // Column(
          //   children: createRadioListUsers(),
          // ),
          Column(
            children: attributes
                .map((attribute) => RadioListTile(
                      value: attribute,
                      groupValue: selectedAttribute,
                      title: Text(attribute.desc),
                      subtitle: Text(attribute.val.toString()),
                      onChanged: (currentAttribute) {
                        // print("Current User ${currentUser?.firstName}");
                        // setSelectedUser(currentUser!);
                        print(currentAttribute == selectedAttribute);
                        print(currentAttribute?.val);
                        print(selectedAttribute?.val);
                        setState(() {
                          selectedAttribute = currentAttribute;
                        });
                      },
                      // selected: selectedAttribute == attribute,
                      activeColor: Colors.green,
                    ))
                .toList(),
          ),
          // Column(
          //   children: createRadioListAttributes(),
          // ),
          Column(
            children: createRadioListAttribute1s(),
          ),
          Divider(
            height: 20,
            color: Colors.green,
          ),
          RadioListTile(
            value: 1,
            groupValue: selectedRadioTile,
            title: Text("Radio 1"),
            subtitle: Text("Radio 1 Subtitle"),
            onChanged: (val) {
              print("Radio Tile pressed $val");
              setSelectedRadioTile(val!);
            },
            activeColor: Colors.red,
            secondary: TextButton(
              child: Text("Say Hi"),
              onPressed: () {
                print("Say Hello");
              },
            ),
            selected: true,
          ),
          RadioListTile(
            value: 2,
            groupValue: selectedRadioTile,
            title: Text("Radio 2"),
            subtitle: Text("Radio 2 Subtitle"),
            onChanged: (val) {
              print("Radio Tile pressed $val");
              setSelectedRadioTile(val!);
            },
            activeColor: Colors.red,
            secondary: TextButton(
              child: Text("Say Hi"),
              onPressed: () {
                print("Say Hello");
              },
            ),
            selected: false,
          ),
          Divider(
            height: 20,
            color: Colors.green,
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              Radio(
                value: 1,
                groupValue: selectedRadio,
                activeColor: Colors.green,
                onChanged: (val) {
                  print("Radio $val");
                  setSelectedRadio(val!);
                },
              ),
              Radio(
                value: 2,
                groupValue: selectedRadio,
                activeColor: Colors.blue,
                onChanged: (val) {
                  print("Radio $val");
                  setSelectedRadio(val!);
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
