import 'package:flutter/cupertino.dart';
import 'package:objectbox/objectbox.dart';

import 'task_model.dart';

@Entity()
class Category extends ChangeNotifier {
  @Id()
  int id = 0;
  String name;

  @Backlink('category')
  final tasks = ToMany<Task>();

  Category({
    this.id = 0,
    required this.name,
  });
}
