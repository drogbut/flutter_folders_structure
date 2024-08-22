import 'package:flutter/material.dart';

import '../../core/constants/colors.dart';
import 'custom_themes/_custom_theme.dart';

class DTheme {
  DTheme._();

  /// LIGHT THEME
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: DColorSchemeTheme.light,
    //scaffoldBackgroundColor: MyColors.darkBackground,
    //primaryColor: MyColors.lightPrimary,

    textTheme: DTextTheme.light,
    appBarTheme: DAppBarTheme.light,
    elevatedButtonTheme: DElevatedButtonTheme.light,
    inputDecorationTheme: DInputDecorationTheme.light,
  );

  /// DARK THEME
  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    colorScheme: DColorSchemeTheme.dark,
    scaffoldBackgroundColor: DColors.dark,
    primaryColor: DColors.primary,
    textTheme: DTextTheme.dark,
    appBarTheme: DAppBarTheme.dark,
    elevatedButtonTheme: DElevatedButtonTheme.dark,
    inputDecorationTheme: DInputDecorationTheme.dark,
  );
}