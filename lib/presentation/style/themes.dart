import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Themes {
  static ThemeData light = ThemeData.light(useMaterial3: true).copyWith(
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blueGrey),
    cardTheme: const CardTheme(
      color: CupertinoColors.systemGroupedBackground,
      surfaceTintColor: CupertinoColors.systemGroupedBackground,
    ),
  );
  static ThemeData dark = ThemeData.dark(useMaterial3: true).copyWith(
    appBarTheme: const AppBarTheme(surfaceTintColor: Colors.transparent),
    primaryColor: Colors.amber,
    brightness: Brightness.dark,
    cardTheme: const CardTheme(
      color: CupertinoColors.systemGroupedBackground,
      surfaceTintColor: CupertinoColors.systemGroupedBackground,
    ),
  );
}
