import 'package:flutter/material.dart';

class UICard {
  Widget newCard({
    required Widget child,
    Color backgorund = Colors.white,
    bool enableImage = false,
    double height = 100,
    var image
  }){
    return Container(
      decoration: BoxDecoration(
        color: backgorund,
        borderRadius: BorderRadius.circular(8.0)
      ),
      child: Row(
        children: [
          enableImage ? SizedBox(
            height: height,
            width: height,
            child: image,
          ) : SizedBox(height: height,),
          enableImage ? const VerticalDivider(width: 8,color: Colors.black,) : const SizedBox(),
          child
        ],
      )
    );
  }
}