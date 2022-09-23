import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/model.dart';

class ItemsState extends ChangeNotifier {
  final List<Item> _items = [];
  List<Item> get items => _items;

  String apiUrl = "https://todoapp-api.apps.k8s.gu.se/todos";
  String apiKey = "?key=9026221e-4436-4fa1-abc6-c3109a269aff";

  ItemsState() {
    _loadItems();
  }

  void _loadItems() async {
    http.Response answer = await http.get(Uri.parse('$apiUrl$apiKey'));
    if (answer.statusCode == 200) {
      List<dynamic> data = jsonDecode(answer.body);
      _items.clear();
      data.forEach((item) {
        _items.add(Item.fromJson(item));
      });
      notifyListeners();
    }
  }

  void addItem(Item item) async {
    http.Response answer = await http.post(Uri.parse('$apiUrl$apiKey'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(item.toJson()));
    if (answer.statusCode == 200) {
      _items.add(item);
      notifyListeners();
    }
  }

  void removeItem(Item item) async {
    http.Response answer =
        await http.delete(Uri.parse('$apiUrl/${item.id}$apiKey'));
    if (answer.statusCode == 200) {
      _items.remove(item);
      notifyListeners();
    }
  }

  void toggleDone(Item item) async {
    item.itemDone(item);
    http.Response answer =
        await http.put(Uri.parse('$apiUrl/${item.id}$apiKey'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(item.toJson()));
    if (answer.statusCode == 200) {
      notifyListeners();
    }
  }

  void clearDone() async {
    List<Item> doneItems = _items.where((item) => item.done).toList();
    for (var item in doneItems) {
      http.Response answer =
          await http.delete(Uri.parse('$apiUrl/${item.id}$apiKey'));
      if (answer.statusCode == 200) {
        _items.remove(item);
      }
    }
    notifyListeners();
  }
}
