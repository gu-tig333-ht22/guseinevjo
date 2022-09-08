import 'package:flutter/material.dart';
import '/constants/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTaskView extends StatefulWidget {
  const AddTaskView({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<AddTaskView> createState() => AddTaskViewState();
}

class AddTaskViewState extends State<AddTaskView> {
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
    );
  }
}
