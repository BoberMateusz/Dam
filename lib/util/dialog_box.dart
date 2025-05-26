import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

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
      content: SizedBox(
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
              MaterialButton(
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Text("Save"),
                  onPressed: (){
                    final obj = constructor(controller.text);
                    list.add(obj);
                    onPressed();
                    box.add(obj);
                  }
              ),
              MaterialButton(
                  color: Theme.of(context).secondaryHeaderColor,
                  child: Text("Cancel"),
                  onPressed: (){
                    Navigator.of(context).pop();
                    controller.clear();
                  }
              ),
            ],
          )
        ],
        ),
      ),
    );
  }
}
