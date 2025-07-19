
import 'package:dam/presentation/pages/cat_page.dart';

import 'package:flutter/material.dart';
import 'package:dam/presentation/pages/tasks_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'data/database/objectbox.dart';
import 'data/repositories/category_repository.dart';
import 'domain/notifiers/category_notifier.dart';




late ObjectBox objectbox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  objectbox = await ObjectBox.create();

  runApp(
      const ProviderScope(
        child: MyApp()
    )
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Dam',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      //home: TasksPage(taskRepository: TaskRepository(objectbox),),
      home: TasksPage2(),
    );
  }
}

//dart run build_runner watch -d


