import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../components/model.dart';

class ItemsState extends ChangeNotifier {
  final List<Item> _items = [];
  List<Item> get items => _items;

  String _filter = 'all';
  String get filter => _filter;

  String apiUrl = "https://todoapp-api.apps.k8s.gu.se/todos";
  String apiKey = "?key=9026221e-4436-4fa1-abc6-c3109a269aff";

  ItemsState() {
    _loadItems();
  }

  void _loadItems() async {
    http.Response answer = await http.get(Uri.parse('$apiUrl$apiKey'));
    if (answer.statusCode == 200) {
      List<dynamic> data = jsonDecode(answer.body);
      updateItems(data);
      notifyListeners();
    }
  }

  void updateItems(List<dynamic> data) {
    _items.clear();
    for (var item in data) {
      _items.add(Item.fromJson(item));
    }
  }

  void addItem(Item item) async {
    http.Response answer = await http.post(Uri.parse('$apiUrl$apiKey'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(item.toJson()));
    if (answer.statusCode == 200) {
      _items.add(item);
      notifyListeners();
      updateItems(jsonDecode(answer.body));
    }
  }

  void removeItem(Item item) async {
    http.Response answer =
        await http.delete(Uri.parse('$apiUrl/${item.id}$apiKey'));
    if (answer.statusCode == 200) {
      _items.remove(item);
      notifyListeners();
      updateItems(jsonDecode(answer.body));
    }
  }

  void toggleDone(Item item) async {
    item.itemDone(item);
    http.Response answer =
        await http.put(Uri.parse('$apiUrl/${item.id}$apiKey'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(item.toJson()));
    if (answer.statusCode == 200) {
      notifyListeners();
      updateItems(jsonDecode(answer.body));
    }
  }

  void filterItems(String filter) {
    _filter = filter;
    notifyListeners();
  }
}
