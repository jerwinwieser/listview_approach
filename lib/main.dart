import 'dart:io';

import 'package:flutter/material.dart';

import 'data/list_items.dart';
import 'model/list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Items',
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<ListItem> items = List.from(listItems);

  void removeItem(int index) {
    setState(() {
      final item = items.removeAt(index);
    });
  }

  void addItem() {
    setState(() {
      int insertIndex = 0;
      items.insert(
        insertIndex,
        ListItem(
          name: 'Del',
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Approaches')),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              title: Text(items[index].name),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => removeItem(index),
                  color: Colors.red),
            ));
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addItem(),
        child: Icon(Icons.add),
      ),
    );
  }
}
