import 'package:dam/main.dart';
import 'package:dam/models/task/task_model.dart';
import 'package:flutter/material.dart';

import '../../repositories/task_repository.dart';
import '../../util/dialog_box.dart';


class TaskWidget extends StatefulWidget {

  Task task;
  Function(Task task) deleteFromList;

  TaskWidget({
    super.key,
    required this.task,
    required this.deleteFromList
  });


  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  static final TaskRepository taskRepository = TaskRepository(objectbox);

  void resetState() {
    setState(() {
      widget.task;
    });
  }

  toggleCompletion() {
    final bool comp = widget.task.isCompleted;
    setState(() {
      widget.task.isCompleted = !comp;
    });

    taskRepository.update(widget.task);

  }
  editTask() {
    final controller = TextEditingController();
    controller.text = widget.task.name;

    //dialogfs
    //delete arguments
  }

  deleteTask() {
    taskRepository.delete(widget.task.id);
    widget.deleteFromList(widget.task);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Checkbox(value: widget.task.isCompleted, onChanged: (a) => toggleCompletion()),
          Expanded(child: Text(widget.task.name)),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: editTask,
            tooltip: 'Edit Task',
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: deleteTask,
            tooltip: 'Delete Task',
          ),


        ],
      ),
    );
  }
}
