import 'package:flutter/material.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/sizes.dart';

class DTextButtonTheme {
  DTextButtonTheme._();

  /// LIGHT
  static TextButtonThemeData light = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: DColors.primary,
      elevation: DSizes.zero,
    ),
  );

  /// DARK
  static TextButtonThemeData dark = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: Colors.white,
      elevation: DSizes.zero,
    ),
  );
}
