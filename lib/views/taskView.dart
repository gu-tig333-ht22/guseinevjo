import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/constants/routes.dart';
import 'package:provider/provider.dart';
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
        actions: [menuButton()],
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
}

//consumer to return todo list
Widget todoList() {
  return Consumer<ItemsState>(
    builder: (context, items, child) {
      return ListView.builder(
        itemCount: items.items.length,
        itemBuilder: (context, i) {
          return Card(
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            elevation: 2,
            child: ListTile(
              //If Item is done then mark checkbox as checked
              leading: Provider.of<ItemsState>(context).items[i].done
                  ? const Icon(
                      Icons.check_box,
                      color: Colors.deepOrange,
                    )
                  : const Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.deepOrange,
                    ),
              onTap: () {
                Provider.of<ItemsState>(context, listen: false)
                    .toggleDone(items.items[i]);
              },
              title: Text(
                //Loop through items and display them
                items.items[i].title,
                maxLines: 1,
                softWrap: true,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.raleway(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  textStyle: TextStyle(
                    //If Item is done then linethrough
                    decoration: Provider.of<ItemsState>(context).items[i].done
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ),
              trailing: IconButton(
                //Removes Item from view when delete button is pressed
                onPressed: () {
                  Provider.of<ItemsState>(context, listen: false)
                      .removeItem(items.items[i]);
                },
                icon: const Icon(Icons.close),
              ),
            ),
          );
        },
      );
    },
  );
}

Widget menuButton() {
  return PopupMenuButton(
    itemBuilder: (context) => [
      //menu button showDone, showUndone, and showAll
      PopupMenuItem(
        child: TextButton(
          onPressed: () {
            Provider.of<ItemsState>(context, listen: false).clearDone();
            Navigator.pop(context);
          },
          child: const Text('Clear Done'),
        ),
      ),
    ],
  );
}
