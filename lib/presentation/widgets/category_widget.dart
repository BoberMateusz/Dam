
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/category_model.dart';
import '../../domain/notifiers/category_notifier.dart';



class CategoryWidget extends ConsumerWidget {
  final Category category;

  const CategoryWidget({
    super.key,
    required this.category
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).secondaryHeaderColor,
      child: Row(
        children: [
          Expanded(child: Text(category.name)),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
            tooltip: 'Add Task',
          ),



          //  IconButton(
          //   icon: const Icon(Icons.edit),
          //   onPressed: () {},
          //   tooltip: 'Edit Category',
          // ),

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


