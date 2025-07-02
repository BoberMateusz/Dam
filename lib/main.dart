import 'package:dam/database/objectbox.dart';
import 'package:dam/repositories/task_repository.dart';
import 'package:flutter/material.dart';
import 'package:dam/pages/tasks_page.dart';


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
      home: TasksPage(taskRepository: TaskRepository(objectbox),),
    );
  }
}


