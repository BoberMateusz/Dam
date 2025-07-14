import 'package:dam/data/models/category_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final categoryProvider = ChangeNotifierProvider<Category>((ref) {
  return Category(name: '');
});
