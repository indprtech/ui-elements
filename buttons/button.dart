import 'package:flutter/material.dart';

import '../utils/HoverDetector.dart';

class Button {
  Widget newButton({
    required String label,
    bool enableIcon = false,
    bool enableLongPress = false,
    bool enableCustomColor = false,
    bool enableAdaptiveWidth = false,
    bool minimalButton = false,
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
        height: disableText ? minimalButton ? 20 : 45 : minimalButton ? 25 : 50,
        child: GestureDetector(
          onTap: () => onTap(),
          onLongPress: () => {enableLongPress ? onLongPreess() : null},
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            decoration: BoxDecoration(
                color: hover ? customHoverColor : customColor,
                borderRadius: BorderRadius.circular(disableText ? 20.0 : 8.0)),
            curve: Curves.easeInCubic,
            child: Padding(
              padding: EdgeInsets.all(minimalButton ? 1.5 : 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  enableIcon
                      ? Icon(
                          icon,
                          color: textColor,
                          size: minimalButton ? 12 : null,
                        )
                      : const SizedBox(),
                  SizedBox(
                    width: disableText ? 0 : 5,
                  ),
                  disableText
                      ? const SizedBox()
                      : Text(
                          label,
                          style: TextStyle(color: textColor),
                        )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget newButtonGroup({
    IconData button1Icon = Icons.remove,
    IconData button2Icon = Icons.add,
    Color customBackground = Colors.green,
    Color customButtonColor = Colors.blue,
    Color customButtonHoverColor = Colors.lightBlueAccent,
    Color textColor = Colors.white,
    double size = 150,
    required Widget child,
    required Function onButton1Tap,
    required Function onButton2Tap,
  }) {
    return SizedBox(
      width: size,
      child: Container(
        decoration: BoxDecoration(
            color: customBackground, borderRadius: BorderRadius.circular(20.0),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Button().newButton(
              width: 50,
                label: "-",
                onTap: () => onButton1Tap(),
                enableIcon: true,
                disableText: true,
            customColor: customButtonColor,
            customHoverColor: customButtonHoverColor,
            icon: button1Icon),
            SizedBox(
              width: size - 100,
              child: Center(child: child),
            ),
            Button().newButton(
                width: 50,
                label: "+",
                onTap: () => onButton2Tap(),
                enableIcon: true,
                disableText: true,
                customColor: customButtonColor,
                customHoverColor: customButtonHoverColor,
                icon: button2Icon)
          ],
        ),
      ),
    );
  }
}
