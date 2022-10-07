import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants/routes.dart';
import 'package:provider/provider.dart';
import '../components/provider.dart';
import '../components/model.dart';

class TaskView extends StatefulWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  State<TaskView> createState() => TaskViewState();
}

class TaskViewState extends State<TaskView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        elevation: 2,
        centerTitle: true,
        title: Center(
          child: Text(
            'TODO',
            style: GoogleFonts.bebasNeue(
              fontSize: 30,
              textStyle: const TextStyle(
                letterSpacing: 1.2,
              ),
            ),
          ),
        ),
        //filteritems on value
        actions: [
          PopupMenuButton(
            onSelected: (String done) {
              Provider.of<ItemsState>(context, listen: false).filterItems(done);
            },
            itemBuilder: (context) => [
              const PopupMenuItem(value: 'all', child: Text('All')),
              const PopupMenuItem(value: 'done', child: Text('Done')),
              const PopupMenuItem(value: 'undone', child: Text('Undone'))
            ],
          ),
        ],
      ),
      body: todoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(addTaskViewRoute);
        },
        backgroundColor: Colors.deepOrange[400],
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget todoList() {
    return Consumer<ItemsState>(
      builder: (context, items, child) => ListView.builder(
        itemCount: items.items.length,
        itemBuilder: (context, index) {
          if (items.filter == 'all') {
            return todoItem(items.items[index]);
          } else if (items.filter == 'done') {
            if (items.items[index].done) {
              return todoItem(items.items[index]);
            }
          } else if (items.filter == 'undone') {
            if (!items.items[index].done) {
              return todoItem(items.items[index]);
            }
          }
          return Container();
        },
      ),
    );
  }

  Widget todoItem(Item item) {
    return Consumer<ItemsState>(
      builder: (context, items, child) => Dismissible(
        key: Key(item.id),
        onDismissed: (direction) {
          items.removeItem(item);
        },
        child: Card(
          elevation: 2,
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListTile(
            leading: Checkbox(
              activeColor: Colors.deepOrange[400],
              value: item.done,
              onChanged: (value) {
                items.toggleDone(item);
              },
            ),
            title: Text(
              item.title,
              maxLines: 2,
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.raleway(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                textStyle: TextStyle(
                  decoration: item.done ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                items.removeItem(item);
              },
            ),
          ),
        ),
      ),
    );
  }
}
