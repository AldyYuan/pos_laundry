import 'package:flutter/material.dart';
import 'package:pos_laundry/app/core/values/colors.dart';

import 'text_theme.dart';

ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(
      primaryColor,
    ),
    shadowColor: MaterialStateProperty.all<Color>(
      primaryColor,
    ),
    elevation: MaterialStateProperty.all<double>(
      16.0,
    ),
    overlayColor: MaterialStateProperty.all<Color>(
      primaryDark,
    ),
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
      const EdgeInsets.all(24.0),
    ),
    shape: MaterialStateProperty.all<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
    ),
    textStyle: MaterialStateProperty.all<TextStyle>(
      bold,
    ),
    foregroundColor: MaterialStateProperty.all<Color>(
      white,
    ),
  ),
);
