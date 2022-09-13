import 'package:flutter/material.dart';

class Item {
  Item({required this.title, required this.done});
  String title;
  bool done;
}

class Items extends ChangeNotifier {
  final List<Item> _items = <Item>[
    Item(title: 'Write a book', done: false),
    Item(title: 'Do homework', done: false),
    Item(title: 'Tidy room', done: false),
    Item(title: 'Watch TV', done: false),
    Item(title: 'Nap', done: false),
    Item(title: 'Eat', done: false),
    Item(title: 'Sleep', done: false),
    Item(title: 'Rave', done: false),
    Item(title: 'Repeat', done: false),
  ];
  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(Item(title: "", done: false));
    notifyListeners();
  }
}

//fixa provider, consumer
