

import 'package:dam/models/category/category_widget.dart';
import 'package:dam/repositories/category_repository.dart';
import 'package:dam/util/dialog_box.dart';
import 'package:flutter/material.dart';

import '../models/category/category_model.dart';

class TasksPage2 extends StatefulWidget {
  final CategoryRepository categoryRepository;

  const TasksPage2({super.key, required this.categoryRepository});

  @override
  State<TasksPage2> createState() => _TasksPage2State();
}

class _TasksPage2State extends State<TasksPage2> {
  late List<Category> categories;

  @override
  void initState() {
    super.initState();
    _loadCategories();
  }

  void _loadCategories() {
    setState(() {
      categories = widget.categoryRepository.getAll();
    });
  }

  void deleteCategory(Category category) {
    setState(() {
      categories.remove(category);
    });
  }



  final _controller = TextEditingController();

  void resetState() {
    setState(() {
      categories;
    });
  }


  void createCategoryOnPressed(text) {
    Category category = Category(name: text);
    categories.add(category);
    resetState();
    widget.categoryRepository.add(category);
  }

  void createNewCategory() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onPressed: createCategoryOnPressed,
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
          itemBuilder: (context, index) => CategoryWidget(category: categories[index]) , itemCount: categories.length,


        )
    );
  }
}
