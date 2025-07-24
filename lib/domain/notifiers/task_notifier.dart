
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository.dart';
import '../../main.dart';

part 'task_notifier.g.dart';

@Riverpod(keepAlive: true)
class TaskNotifier extends _$TaskNotifier {
   final TaskRepository taskRepository = TaskRepository(objectbox); //todo: create repo provider


  @override
  List<Task> build() {
    return fetchTasks();
  }


  List<Task> fetchTasks() {
    return taskRepository.getAll();
  }

  void addTask(text) {
    Task task = Task(name: text);
    state = [...state, task];
    taskRepository.add(task);
  }

   void editTask(Task task, String text) {
     task.name = text;
     taskRepository.update(task);
     state = state.map((e) => e.id == task.id ? task : e).toList();
   }

   void deleteTask(Task task) {
     taskRepository.delete(task.id);
     state = state.where((element) => element.id != task.id).toList();
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