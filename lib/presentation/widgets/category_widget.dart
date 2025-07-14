
import 'package:flutter/material.dart';

import '../../data/models/category_model.dart';
import '../../domain/category/category_controller.dart';
import 'dialog_box.dart';



class CategoryWidget extends StatefulWidget {
  final CategoryController categoryController;
  final Category category;

  const CategoryWidget({
    super.key,
    required this.categoryController,
    required this.category
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {




  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: TextEditingController(),
          onPressed: widget.categoryController.createTaskOnPressed,
          hintText: "Create a Task",
        );
      },
    );
  }

  void deleteCategory(Category category) {
    widget.categoryController.deleteCategory(category);
    setState(() {
      widget.categoryController.categories;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).secondaryHeaderColor,
      child: Row(
        children: [
          Expanded(child: Text(widget.category.name)),
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
            onPressed: () => deleteCategory(widget.category),
            tooltip: 'Delete Category',
          ),


        ],
      ),
    );
  }
}
