
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

  void deleteTask(Task task) { //todo: later
    taskRepository.delete(task.id);

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