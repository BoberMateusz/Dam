
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

  void deleteCategory(Category category) { //todo: later
    categoryRepository.delete(category.id);
    //todo: delete tasks
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