import 'dart:io';

import 'package:flutter/material.dart';

import 'data/list_items.dart';
import 'model/list_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<ListItem> _data = List.from(listItems);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List Items',
      home: Scaffold(
        appBar: AppBar(title: const Text('Approaches')),
        body: Approach(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}

class Approach extends StatefulWidget {
  @override
  _ApproachState createState() => _ApproachState();
}

class _ApproachState extends State<Approach> {
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
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(items[index].name),
            trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => removeItem(index),
                color: Colors.red),
            leading: IconButton(
                icon: Icon(Icons.add),
                onPressed: () => addItem(),
                color: Colors.green),
          ));
        });
  }
}
