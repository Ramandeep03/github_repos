import 'package:flutter/material.dart';
import 'global_colors.dart';

class GlobalTheme {
  static ThemeData githubTheme = ThemeData(
    scaffoldBackgroundColor: GlobalColors.primary,
    appBarTheme: const AppBarTheme(
      centerTitle: true,
      backgroundColor: GlobalColors.secondary,
      iconTheme: IconThemeData(
        size: 30,
        color: GlobalColors.textColor,
      ),
      actionsIconTheme: IconThemeData(
        size: 25,
        color: GlobalColors.textColor,
      ),
    ),
  );
}
