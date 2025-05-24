import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v1.dart';
import 'package:uuid/v4.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends StatefulWidget {
  Task({
    super.key,
    required this.id,
    required this.name,
    this.completion = false,
  });

  @HiveField(0)
  String id;
  @HiveField(1)
  String name;
  @HiveField(2)
  bool completion;


  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  final Box<Task> box = Hive.box<Task>('tasks');

  changeState() {
    final bool comp = widget.completion;
    setState(() {
      widget.completion = !comp;
    });
    box.put(widget.id, Task(
        id: widget.id,
        name: widget.name,
        completion: !comp,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Checkbox(value: widget.completion, onChanged: (a) => changeState()),
          Text(widget.name)
        ],
      ),
    );
  }
}
