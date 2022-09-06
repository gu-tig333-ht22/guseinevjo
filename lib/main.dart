import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'TIG169 TODO'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class item {
  item({required this.title, required this.done});
  String title;
  bool done;
}

class _MyHomePageState extends State<MyHomePage> {
  List<item> items = <item>[
    item(title: 'Write a book', done: false),
    item(title: 'Do homework', done: false),
    item(title: 'Tidy room', done: false),
    item(title: 'Watch TV', done: true),
    item(title: 'Nap', done: false),
    item(title: 'Eat', done: false),
    item(title: 'Sleep', done: false),
    item(title: 'Rave', done: true),
    item(title: 'Repeat', done: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        elevation: 2,
        title: Center(
          child: Text(
            widget.title,
            style: GoogleFonts.bebasNeue(
              fontSize: 30,
              textStyle: const TextStyle(
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, i) {
          return Card(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            elevation: 2,
            child: ListTile(
              leading: items[i].done.toString() == 'true'
                  ? const Icon(Icons.check_box_sharp)
                  : const Icon(Icons.check_box_outline_blank_outlined),
              onTap: () {
                setState(
                  () {
                    items[i].done.toString() == 'true'
                        ? items[i].done = false
                        : items[i].done = true;
                  },
                );
              },
              title: Text(
                items[i].title,
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textStyle: TextStyle(
                    decoration: items[i].done.toString() == 'true'
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(
                    () {
                      items.removeWhere(
                        (item) => item.title == items[i].title,
                      );
                    },
                  );
                },
                icon: const Icon(Icons.close),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepOrange[400],
        child: const Icon(Icons.add),
      ),
    );
  }
}
