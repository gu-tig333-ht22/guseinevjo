class Item {
  Item({required this.title, this.done = false, required this.id});
  String title;
  bool done;
  String id;

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['title'],
      done: json['done'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'done': done,
      'id': id,
    };
  }

  void itemDone(Item) {
    done = !done;
  }
}
