import 'package:flutter/material.dart';


class DialogBox<T extends Object> extends StatelessWidget {
  final TextEditingController controller;
  final Function onPressed;

  final String hintText;
  const DialogBox({
    super.key,
    required this.controller,
    required this.onPressed,
    required this.hintText,
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
                hintText: hintText
            ),
          ),

          Row(
            children: [
              MaterialButton(
                  color: Theme.of(context).secondaryHeaderColor,
                  onPressed: (){
                    String text = controller.text;
                    onPressed(text);
                  },
                  child: Text("Save")
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
