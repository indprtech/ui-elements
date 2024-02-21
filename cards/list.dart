import '../utils/SimpleText.dart';
import 'package:flutter/material.dart';

class UIList {
  Widget newList(
      {required String label,
      IconData icon = Icons.android,
      Color backgorund = Colors.white,
      required Widget child,
      required Function onTap,
      bool enableIcon = false}) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        decoration: BoxDecoration(
            color: backgorund, borderRadius: BorderRadius.circular(8.0)),
        child: Row(
          children: [
            enableIcon ? Icon(icon) : const SizedBox(),
            enableIcon
                ? const SizedBox(
                    width: 10,
                  )
                : const SizedBox(),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SimpleText().newText(label, weight: FontWeight.w800),
                child
              ],
            )
          ],
        ),
      ),
    );
  }
}
