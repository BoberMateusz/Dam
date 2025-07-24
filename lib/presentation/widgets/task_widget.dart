
import 'package:dam/data/models/task_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


import '../../domain/notifiers/task_notifier.dart';
import 'dialog_box.dart';



class TaskWidget extends ConsumerWidget {
  final Task task;

  const TaskWidget({
    super.key,
    required this.task
  });


  void _editTask(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: TextEditingController(text: task.name),
          onPressed: (text) => ref.read(taskNotifierProvider.notifier).editTask(task, text),
          hintText: "Edit Task",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).primaryColor,
      child: Row(
        children: [
          Expanded(child: Text(task.name)),

          // IconButton(
          //   icon: const Icon(Icons.add),
          //   onPressed: () {},
          //   tooltip: 'Add Task',
          // ),


           IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editTask(context, ref),
            tooltip: 'Edit Task',
          ),

          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => ref.read(taskNotifierProvider.notifier).deleteTask(task),
            tooltip: 'Delete Task',
          ),


        ],
      ),
    );
  }
}


