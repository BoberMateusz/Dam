import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id = 0;
  String name;
  bool isCompleted;

  Task({
    this.id = 0,
    required this.name,
    this.isCompleted = false,
  });


}
