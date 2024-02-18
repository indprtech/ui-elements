import 'package:example_ui_elements/uiElements/utils/HoverDetector.dart';
import 'package:flutter/material.dart';

import '../utils/NavigatorController.dart';

class BottomNavBarElements {
  static Widget navigationBar({required BuildContext context,
    required NavigatorController controller,
    required List<Widget> children}) {
    return SizedBox(
      height: 60,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Theme
              .of(context)
              .secondaryHeaderColor,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: children,
            ),
          ),
        ),
      ),
    );
  }

  static Widget navigationElement({required int index,
    required NavigatorController controller,
    required BuildContext context,
    required Function setIndex,
    required String label,
    required IconData icon,
    bool enableBadge = false,
    int badgeCount = 0,
    double iconSize = 24}) {
    return HoverBuilder(builder: (hover) {
      return GestureDetector(
        onTap: () => {setIndex(index)},
        child: SizedBox(
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                  color: controller.currentIndex == index
                      ? Theme
                      .of(context)
                      .cardColor
                      : hover
                      ? Theme
                      .of(context)
                      .cardColor
                      : Theme
                      .of(context)
                      .bottomNavigationBarTheme
                      .backgroundColor,
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    enableBadge ? Badge(
                      label: Text(badgeCount.toString()),
                      child: Icon(
                        icon,
                        size: iconSize,
                      ),
                    ) : Icon(
                      icon,
                      size: iconSize,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Text(label)
                  ],
                ),
              ),
            )),
      );
    });
  }
}
