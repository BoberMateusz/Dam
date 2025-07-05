import 'package:flutter/material.dart';

import 'category_model.dart';

class CategoryWidget extends StatefulWidget {
  final Category category;

  const CategoryWidget({
    super.key,
    required this.category
  });

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).secondaryHeaderColor,
      child: Row(
        children: [
          Expanded(child: Text(widget.category.name)),
           IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
            tooltip: 'Edit Category',
          ),
           IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
            tooltip: 'Delete Category',
          ),


        ],
      ),
    );
  }
}
