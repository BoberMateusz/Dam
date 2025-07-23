
import 'package:objectbox/objectbox.dart';
import '../database/objectbox.dart';
import '../models/task_model.dart';
import 'dao.dart';


class TaskRepository implements DAO<Task> {
  final ObjectBox _objectBox; // Store the ObjectBox instance
  late final Box<Task> taskBox; // The box for your Task entity

  // Constructor that accepts ObjectBox
  TaskRepository(this._objectBox) {
    taskBox = _objectBox.store.box<Task>(); // Initialize the box
  }

  @override
  int add(Task task) {
    return taskBox.put(task);
  }

  @override
  Task? getById(int id) {
    return taskBox.get(id);
  }

  @override
  List<Task> getAll() {
    return taskBox.getAll();
  }

  @override
  Stream<List<Task>> watchAll() {
    // Example of a reactive query
    return taskBox.query().watch(triggerImmediately: true).map((query) => query.find());
  }

  @override
  int update(Task task) {
    return taskBox.put(task);
  }

  @override
  bool delete(int id) {
    return taskBox.remove(id);
  }



  // // Add more specific query methods as needed
//   // Task? getTaskByName(String name) {
//   //   final query = taskBox.query(Task.name.equals(name)).build();
//   //   final user = query.findFirst();
//   //   query.close();
//   //   return user;
//   // }
}