import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'my_button.dart';

class DialogBox<T extends Object> extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onPressed;
  final List<T> list;
  final Box<T> box;
  final T Function(String text) constructor;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.box,
    required this.constructor,
    required this.list
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        height: 120,
        child: Column(children: [
          TextField(
            controller: controller,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add a new task"
            ),
          ),

          Row(
            children: [
              MyButton(text: "Save", onPressed: (){
                final obj = constructor(controller.text);
                list.add(obj);
                onPressed();
                box.add(obj);
              }),
              MyButton(text: "Cancel", onPressed: (){
                Navigator.of(context).pop();
                controller.clear();


              })
            ],
          )
        ],
        ),
      ),
    );
  }
}
