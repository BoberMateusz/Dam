import 'package:dam/models/category/category_model.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Task {
  @Id()
  int id = 0;
  String name;
  bool isCompleted;
  final category = ToOne<Category>();

  Task({
    this.id = 0,
    required this.name,
    this.isCompleted = false,
  });


}
