import 'package:flutter/material.dart';
import '../utils/utils.dart';

const AppBarTheme appBarLightTheme = AppBarTheme(
  backgroundColor: Colors.white,
  elevation: 0,
  iconTheme: IconThemeData(color: Colors.black),
  titleTextStyle:
      TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
);

const BottomNavigationBarThemeData bottomNavigationBarLightTheme =
    BottomNavigationBarThemeData(
        elevation: 0,
        showUnselectedLabels: true,
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: primaryColor),
        unselectedIconTheme: IconThemeData(
          color: Colors.grey,
        ),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          color: Colors.black,
        ),
        unselectedLabelStyle: TextStyle(color: Colors.grey),
        selectedItemColor: primaryColor);

ScrollbarThemeData scrollbarThemeData = ScrollbarThemeData(
  trackColor: WidgetStateProperty.all(primaryColor),
);

const CardTheme lightcardTheme = CardTheme(color: Color(0xFFF8F8F9));

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
      brightness: Brightness.light,
      fontFamily: "Plus Jakarta",
      // primarySwatch: MaterialColor(0, {0: Colors.green.shade900}),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      iconTheme: const IconThemeData(color: accentColor),
      textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.black)),
      cardColor: Theme.of(context).colorScheme.secondary,
      primaryIconTheme: const IconThemeData(color: accentColor),
      dividerTheme: const DividerThemeData(color: accentColor),
      appBarTheme: appBarLightTheme.copyWith(
          iconTheme: const IconThemeData(color: accentColor)),
      scrollbarTheme: scrollbarThemeData,
      cardTheme: lightcardTheme.copyWith(
          shadowColor: accentColor, surfaceTintColor: accentColor),
      listTileTheme: const ListTileThemeData(
          selectedTileColor: Colors.black, iconColor: accentColor),
      highlightColor: accentColor,
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: accentColor),
      bottomNavigationBarTheme: bottomNavigationBarLightTheme.copyWith(
          selectedIconTheme: const IconThemeData(color: accentColor),
          selectedItemColor: accentColor));
}
