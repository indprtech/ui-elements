import 'package:flutter/material.dart';

class SimpleText {
  Widget newText(var text,{
    double size = 18.0,
    Color color = Colors.black,
    FontWeight weight = FontWeight.w400
  }){
    return Text(text.toString(),style: TextStyle(
      fontSize: size,
      color: color,
      fontWeight: weight
    ),);
  }
}