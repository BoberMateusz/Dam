import 'package:dam/main.dart';
import 'package:dam/models/task/task_model.dart';
import 'package:flutter/material.dart';

import '../../repositories/task_repository.dart';


class TaskWidget extends StatefulWidget {

  Task task;

  TaskWidget({
    super.key,
    required this.task
  });


  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  static final TaskRepository taskRepository = TaskRepository(objectbox);

  changeState() {
    final bool comp = widget.task.isCompleted;
    setState(() {
      widget.task.isCompleted = !comp;
    });

    taskRepository.update(widget.task);

  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Checkbox(value: widget.task.isCompleted, onChanged: (a) => changeState()),
          Text(widget.task.name)
        ],
      ),
    );
  }
}
