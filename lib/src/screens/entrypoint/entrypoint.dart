import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../app.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key, required this.productsModel});

  final ProductsModel productsModel;

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> with WidgetsBindingObserver {
  int _selectedIndex = 0;
  bool loading = false;

  final iconList = <IconData>[Icons.home, Icons.favorite];

  @override
  Widget build(BuildContext context) {
    String bottomText(int index) {
      String textVar = "Home";
      switch (index) {
        case 0:
          textVar = "Home";
        case 1:
          textVar = "Favorites";
        default:
          textVar = "Home";
          break;
      }
      return textVar;
    }

    final List<Widget> pages = [
      Homepage(productsModel: widget.productsModel),
      const Favourites()
    ];

    return Scaffold(
        extendBody: true,
        body: pages.elementAt(_selectedIndex),
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            activeIndex: _selectedIndex,
            onTap: (index) {
              setState(() => _selectedIndex = index);
            },
            itemCount: iconList.length,
            gapLocation: GapLocation.none,
            tabBuilder: (int index, bool isActive) {
              final color = isActive
                  ? Theme.of(context).bottomNavigationBarTheme.selectedItemColor
                  : Theme.of(context)
                      .bottomNavigationBarTheme
                      .unselectedItemColor;
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Icon(iconList[index],
                          size: index == 2 ? 15 : 24, color: color)),
                  Text(bottomText(index),
                      maxLines: 1,
                      style: isActive
                          ? Theme.of(context)
                              .bottomNavigationBarTheme
                              .selectedLabelStyle
                          : Theme.of(context)
                              .bottomNavigationBarTheme
                              .unselectedLabelStyle)
                ],
              );
            }));
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
