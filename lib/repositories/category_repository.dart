import 'package:dam/models/category/category_model.dart';
import 'package:objectbox/objectbox.dart';
import '../database/objectbox.dart';
import 'dao.dart';


class CategoryRepository implements DAO<Category> {
  final ObjectBox _objectBox; // Store the ObjectBox instance
  late final Box<Category> categoryBox; // The box for your Task entity

  // Constructor that accepts ObjectBox
  CategoryRepository(this._objectBox) {
    categoryBox = _objectBox.store.box<Category>(); // Initialize the box
  }

  @override
  int add(Category category) {
    return categoryBox.put(category);
  }

  @override
  Category? getById(int id) {
    return categoryBox.get(id);
  }

  @override
  List<Category> getAll() {
    return categoryBox.getAll();
  }

  @override
  Stream<List<Category>> watchAll() {
    // Example of a reactive query
    return categoryBox.query().watch(triggerImmediately: true).map((query) => query.find());
  }

  @override
  int update(Category category) {
    return categoryBox.put(category);
  }

  @override
  bool delete(int id) {
    return categoryBox.remove(id);
  }



  // // Add more specific query methods as needed
//   // Task? getTaskByName(String name) {
//   //   final query = taskBox.query(Task.name.equals(name)).build();
//   //   final user = query.findFirst();
//   //   query.close();
//   //   return user;
//   // }
}