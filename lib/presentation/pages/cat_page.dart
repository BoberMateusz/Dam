
import 'package:flutter/material.dart';

import '../../domain/category/category_controller.dart';
import '../widgets/category_widget.dart';
import '../widgets/dialog_box.dart';



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

  void createOnPressed(String text) {
    widget.categoryController.createCategoryOnPressed(text);
    setState(() {
      widget.categoryController.categories;
    });
  }

  void createNewCategory() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: TextEditingController(),
          onPressed: createOnPressed,
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
          itemBuilder: (context, index) => CategoryWidget(category: widget.categoryController.categories[index], categoryController: widget.categoryController) , itemCount: widget.categoryController.categories.length,


        )
    );
  }
}
