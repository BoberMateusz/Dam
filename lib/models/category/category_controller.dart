import 'package:dam/models/category/category_model.dart';

import '../../repositories/category_repository.dart';
import '../task/task_model.dart';

class CategoryController {
  final CategoryRepository categoryRepository;
  late List<Category> categories = categoryRepository.getAll();

  CategoryController(this.categoryRepository);


  void createCategoryOnPressed(text) {
    Category category = Category(name: text);
    categories.add(category);
    categoryRepository.add(category);
  }

  void deleteCategory(Category category) {
    categories.remove(category);
    categoryRepository.delete(category.id);
    //todo: delete tasks
  }

  void createTaskOnPressed(text) {
    Task task = Task(name: text);
    //task.category.target = this;

    // tasks.add(task);
    // resetState();
    // widget.taskRepository.add(task);
  }

}