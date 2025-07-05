import 'package:dam/database/objectbox.dart';
import 'package:dam/pages/cat_page.dart';
import 'package:dam/repositories/category_repository.dart';
import 'package:dam/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:dam/pages/tasks_page.dart';

import 'models/category/category_controller.dart';


late ObjectBox objectbox;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();





  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      //home: TasksPage(taskRepository: TaskRepository(objectbox),),
      home: TasksPage2(categoryController: CategoryController(CategoryRepository(objectbox))),
    );
  }
}

//todo: flutter pub run build_runner build --delete-conflicting-outputs


