import 'package:flutter/material.dart';

class Mybutton extends StatelessWidget {
  final String bname;
  VoidCallback onPressed;
  Mybutton({
    super.key,
    required this.bname, 
    required this.onPressed,
    });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child:Text(bname),
      color: Colors.yellow,

    );
  }
}