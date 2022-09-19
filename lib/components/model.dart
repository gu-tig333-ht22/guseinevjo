import 'package:flutter/material.dart';

class Item {
  Item({required this.title, this.done = false});
  String title;
  bool done;

  void itemDone(Item) {
    done = !done;
  }
}

class ItemsState extends ChangeNotifier {
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
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }

  void isDone(Item item) {
    item.itemDone(item);
    notifyListeners();
  }
}
