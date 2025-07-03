

import 'package:dam/util/dialog_box.dart';
import 'package:flutter/material.dart';

import '../models/task/task_model.dart';
import '../models/task/task_widget.dart';
import '../repositories/task_repository.dart';

class TasksPage extends StatefulWidget {
  final TaskRepository taskRepository;

  const TasksPage({super.key, required this.taskRepository});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  late List<Task> tasks;

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  void _loadTasks() {
    setState(() {
      tasks = widget.taskRepository.getAll();
    });
  }

  void deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }



  final _controller = TextEditingController();

  void resetState() {
    setState(() {
      tasks;
    });
  }

  void createOnPressed(text) {
    Task task = Task(name: text);
    tasks.add(task);
    resetState();
    widget.taskRepository.add(task);
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onPressed: createOnPressed,
            hintText: "Create a Task",
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
        itemBuilder: (context, index) => TaskWidget(task: tasks[index], deleteFromList: deleteTask) , itemCount: tasks.length,


      )
    );
  }
}
