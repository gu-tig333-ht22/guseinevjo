import 'package:flutter/material.dart';
import 'package:template/views/addTaskView.dart';
import 'package:template/views/taskView.dart';
import '/constants/routes.dart';
import 'package:provider/provider.dart';
import 'components/model.dart';
////Remember to run "Flutter pub get" in the terminal to get the required packages to run this app

void main() {
  ItemsState items = ItemsState();
  runApp(
    ChangeNotifierProvider(
      create: (context) => items,
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: const TaskView(),
        debugShowCheckedModeBanner: false,
        routes: {
          taskViewRoute: (context) => const TaskView(),
          addTaskViewRoute: (context) => const AddTaskView(),
        },
      ),
    ),
  );
}
