import 'package:flutter/material.dart';
import 'package:template/views/addTaskView.dart';
import 'package:template/views/taskView.dart';
import '/constants/routes.dart';
//Remember to run "Flutter pub get" in the terminal to get the required packages to run this app

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const TaskView(
        title: 'hello',
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        taskViewRoute: (context) => const TaskView(title: 'hello'),
        addTaskViewRoute: (context) => const AddTaskView(title: 'hello'),
      },
    ),
  );
}
