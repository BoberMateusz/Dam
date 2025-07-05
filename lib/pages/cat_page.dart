

import 'package:dam/models/category/category_controller.dart';
import 'package:dam/models/category/category_widget.dart';
import 'package:dam/repositories/category_repository.dart';
import 'package:dam/util/dialog_box.dart';
import 'package:flutter/material.dart';

import '../models/category/category_model.dart';

class TasksPage2 extends StatefulWidget {
  final CategoryController categoryController;

  const TasksPage2({
    super.key,
    required this.categoryController
  });

  @override
  State<TasksPage2> createState() => _TasksPage2State();
}

class _TasksPage2State extends State<TasksPage2> {
    late List<Category> categories = widget.categoryController.categories;

  // @override
  // void initState() {
  //   super.initState();
  //   _loadCategories();
  // }
  //
  // void _loadCategories() {
  //   setState(() {
  //     categories;
  //   });
  // }

  void deleteCategory(Category category) {
    setState(() {
      categories.remove(category);
      //todo: delete cat from db
      //todo: delete tasks
    });
  }




  void resetState() {
    setState(() {
      categories;
    });
  }




  void createNewCategory() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: TextEditingController(),
          onPressed: widget.categoryController.createCategoryOnPressed, //todo:change to list, add resetState
          hintText: "Create a Category",
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
          onPressed: createNewCategory,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) => CategoryWidget(category: categories[index], categoryController: widget.categoryController) , itemCount: categories.length,


        )
    );
  }
}
