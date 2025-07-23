
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/models/category_model.dart';
import '../../domain/notifiers/category_notifier.dart';
import '../widgets/category_widget.dart';
import '../widgets/dialog_box.dart';



class TasksPage extends ConsumerWidget {

  const TasksPage({
    super.key,
  });







  void _createNewCategory(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: TextEditingController(),
          onPressed: ref.read(categoryNotifierProvider.notifier).addCategory,
          hintText: "Create a Category",
        );
      },
    );
  }



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Category> categories = ref.watch(categoryNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text("Tasks"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _createNewCategory(context, ref),
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) =>
          CategoryWidget(category: categories[index]),
          itemCount: categories.length,


        )
    );
  }
}


