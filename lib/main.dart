import 'package:flutter/material.dart';
import 'package:flutter_contacts/model/ContactItem.dart';
import 'widgets/ItemContact.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'My Contacts'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

List<ContactItem> items = [
  ContactItem(
      userId: "0",
      title: "Person 1",
      number: "3223",
      imageUrl:
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  ContactItem(
      userId: "1",
      title: "Person 2",
      number: "676676",
      imageUrl:
          "https://www.shutterstock.com/image-photo/young-handsome-man-beard-wearing-260nw-1768126784.jpg"),
];

class _MyHomePageState extends State<MyHomePage> {
  void _deleteItem(String userId) {
    setState(() {
      items.removeWhere((element) => element.userId == userId);
    });
  }

  void _additem(ContactItem item) {
    setState(() {
      items.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView(
            itemExtent: 90,
            children: items.map((item) {
              return ContactItemWidget(
                  contactItem: item, deleteItem: _deleteItem);
            }).toList(),
          ))
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController name = TextEditingController();
              TextEditingController phone = TextEditingController();
              TextEditingController imageurl = TextEditingController();

              return AlertDialog(
                title: const Text('Add a Contact'),
                content: Container(
                    height: 150,
                    width: 300,
                    child: Column(
                      children: [
                        TextField(
                          controller: name,
                          decoration: InputDecoration(hintText: "Name"),
                        ),
                        TextField(
                          controller: phone,
                          decoration: InputDecoration(hintText: "Phone number"),
                        ),
                        TextField(
                          controller: imageurl,
                          decoration: InputDecoration(hintText: "Image url"),
                        ),
                      ],
                    )),
                actions: [
                  TextButton(
                    child: const Text('Cencel'),
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                  ),
                  TextButton(
                    child: const Text('Add'),
                    onPressed: () => {
                      _additem(ContactItem(
                          userId: items.length.toString(),
                          title: name.text,
                          number: phone.text,
                          imageUrl: imageurl.text)),
                      Navigator.pop(context)
                    },
                  ),
                ],
              ).build(context);
            },
          )
        },
        tooltip: 'Add Contact',
        child: const Icon(Icons.add),
      ),
    );
  }
}
