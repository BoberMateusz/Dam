import 'package:dam/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/v4.dart';

import '../util/task.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {

  final Box<Task> box = Hive.box<Task>('tasks');
  late List<Task> tasks = box.values.toList();

  final _controller = TextEditingController();

  void resetState() {
    setState(() {
      tasks;
    });
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onPressed: resetState,
            list: tasks,
            box: box,
            constructor: (String text) {
              return Task(
                name: text,
                id: UuidV4().generate(),
              );},
        );
    },
    );
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Tasks"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child: Icon(Icons.add),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => tasks[index], itemCount: tasks.length,
      )
    );
  }
}
