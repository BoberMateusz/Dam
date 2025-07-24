
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/category_model.dart';
import '../../data/models/task_model.dart';
import '../../data/repositories/category_repository.dart';
import '../../main.dart';

part 'category_notifier.g.dart';

@Riverpod(keepAlive: true)
class CategoryNotifier extends _$CategoryNotifier {
   final CategoryRepository categoryRepository = CategoryRepository(objectbox); //todo: create repo provider


  @override
  List<Category> build() {
    return fetchCategories();
  }


  List<Category> fetchCategories() {
    return categoryRepository.getAll();
  }

  void addCategory(text) {
    Category category = Category(name: text);
    state = [...state, category];
    categoryRepository.add(category);
  }

  void editCategoryName(Category category, String text) {
    category.name = text;
    categoryRepository.update(category);
    state = state.map((e) => e.id == category.id ? category : e).toList();
  }

  void deleteCategory(Category category) {
    categoryRepository.delete(category.id);
    state = state.where((element) => element.id != category.id).toList();
  }


//Tasks
   void addTask(Category category, Task task) {
     category.tasks.add(task);
     categoryRepository.update(category);
     state = state.map((e) => e.id == category.id ? category : e).toList();
   }

   void editTask(Category category, Task task, String text) {
     task.name = text;
     categoryRepository.update(category);
     state = state.map((e) => e.id == category.id ? category : e).toList();
   }

   void deleteTask(Category category, Task task) {
     category.tasks.remove(task);
     categoryRepository.update(category);
     state = state.map((e) => e.id == category.id ? category : e).toList();
   }




  // void createTaskOnPressed(text) {
  //   Task task = Task(name: text);
  //   //task.category.target = this;
  //
  //   // tasks.add(task);
  //   // resetState();
  //   // widget.taskRepository.add(task);
  // }

}