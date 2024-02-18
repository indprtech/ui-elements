import 'package:flutter/material.dart';

import '../utils/HoverDetector.dart';

class Button{
  Widget newButton({
    required String label,
    bool enableIcon = false,
    bool enableLongPress = false,
    bool enableCustomColor = false,
    bool enableAdaptiveWidth = false,
    bool disableText = false,
    double width = 120,
    Color customColor = Colors.blue,
    Color customHoverColor = Colors.lightBlueAccent,
    Color textColor = Colors.white,
    IconData icon = Icons.android,
    required Function onTap,
    var onLongPreess,
  }) {
    return HoverBuilder(builder: (hover) {
      return SizedBox(
        width: enableAdaptiveWidth ? null : width,
        height: disableText ? 45 : 50,
        child: GestureDetector(
          onTap: () => onTap(),
          onLongPress: () => {
            enableLongPress ? onLongPreess() : null
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
              color: hover ? customHoverColor : customColor,
                borderRadius: BorderRadius.circular(disableText ? 20.0 :8.0)
            ),
            curve: Curves.easeInCubic,
            child: Padding(
              padding: const EdgeInsets.all(10.0),child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                enableIcon ? Icon(icon,color: textColor,) : const SizedBox(),
                SizedBox(width: disableText?0:5,),
                disableText ? const SizedBox() : Text(label,style: TextStyle(color: textColor),)
              ],
            ),
            ),
          ),
        ),
      );
    });
  }
}