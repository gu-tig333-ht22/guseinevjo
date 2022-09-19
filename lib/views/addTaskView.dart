import 'package:flutter/material.dart';
import '/constants/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import '../components/model.dart';
import 'package:provider/provider.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key}) : super(key: key);

  @override
  State<AddTaskView> createState() => AddTaskViewState();
}

class AddTaskViewState extends State<AddTaskView> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[400],
        title: Text(
          'New Task',
          style: GoogleFonts.bebasNeue(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: TextField(
          controller: _controller,
          keyboardType: TextInputType.multiline,
          maxLines: null,
          style: GoogleFonts.raleway(
            textStyle: const TextStyle(letterSpacing: .4),
          ),
          decoration: InputDecoration(
            hintText: 'Start typing your task...',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_controller.text.isEmpty) {
            return;
          } else {
            Provider.of<ItemsState>(context, listen: false)
                .addItem(Item(title: _controller.text, done: false));
            Navigator.pop(context, taskViewRoute);
          }
        },
        backgroundColor: Colors.deepOrange[400],
        child: const Icon(Icons.add),
      ),
    );
  }
}
