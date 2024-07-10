import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_to_do/util/mybutton.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
       
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextField(
          controller: controller,
           decoration: InputDecoration(
            hintText: "Add A Task",
            border: OutlineInputBorder(),
          
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
            //save button
              Mybutton(bname: "save", onPressed:onSave),
              SizedBox(width: 20,),
              Mybutton(bname: "Cancel", onPressed:onCancel),

            //cancel button
          ],)
        ],),
       
        
      ),
    );
  }
}