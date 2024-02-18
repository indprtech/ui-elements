# Bottom Naviagtion Bar

## Declaring Controller
```dart
late final NavigatorController _controller = NavigatorController();
```

## Rendering Widget
```dart
      BottomNavBarElements.navigationBar(
          context: context,
          controller: _controller,
          children: [
            BottomNavBarElements.navigationElement(
                index: 0,
                label: "Test",
                icon: Icons.add,
                context: context,
                controller: _controller,
                setIndex: (index) => setState(() {_controller.currentIndex = index;})),
            BottomNavBarElements.navigationElement(
                index: 1,
                label: "Oo",
                icon: Icons.minimize,
                context: context,
                controller: _controller,
                setIndex: (index) => setState(() {_controller.currentIndex = index;})),
            BottomNavBarElements.navigationElement(
                index: 2,
                label: "Badge Test",
                icon: Icons.info,
                context: context,
                controller: _controller,
                enableBadge: true,
                badgeCount: 2,
                setIndex: (index) => setState(() {_controller.currentIndex = index;}))
          ]),
    )
```