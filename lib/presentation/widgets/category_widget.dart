
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/category_model.dart';
import '../../domain/notifiers/category_notifier.dart';
import '../../domain/notifiers/task_notifier.dart';
import 'dialog_box.dart';



class CategoryWidget extends ConsumerWidget {
  final Category category;

  const CategoryWidget({
    super.key,
    required this.category
  });


  void _addTask(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: TextEditingController(),
          onPressed: (text) => ref.read(taskNotifierProvider.notifier).addTask(text), //todo: how should tasks be connected to categories? why task_repo?
          hintText: "Add Task",
        );
      },
    );
  }


  void _editCategory(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: TextEditingController(text: category.name),
          onPressed: (text) => ref.read(categoryNotifierProvider.notifier).editCategory(category, text),
          hintText: "Edit Category",
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).secondaryHeaderColor,
      child: Row(
        children: [
          Expanded(child: Text(category.name)),


          IconButton(
            icon: const Icon(Icons.arrow_drop_down),
            onPressed: () => _addTask(context, ref),
            tooltip: 'Add Task',
          ),

          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => _addTask(context, ref),
            tooltip: 'Add Task',
          ),



           IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => _editCategory(context, ref),
            tooltip: 'Edit Category',
          ),

          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => ref.read(categoryNotifierProvider.notifier).deleteCategory(category),
            tooltip: 'Delete Category',
          ),


        ],
      ),
    );
  }
}


