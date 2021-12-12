import 'package:flutter/material.dart';
import 'package:pos_laundry/app/core/themes/card_theme.dart';
import 'package:pos_laundry/app/core/themes/input_decoration_theme.dart';
import 'package:pos_laundry/app/core/values/colors.dart';

import 'app_bar_theme.dart';
import 'button_theme.dart';

ThemeData themeData = ThemeData(
  // This is the theme of your application.
  primaryColor: primaryColor,
  colorScheme: const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: grey,
    background: white,
    onError: red,
    brightness: Brightness.light,
    error: red,
  ),
  textTheme: const TextTheme().apply(
    bodyColor: black,
    displayColor: black,
  ),
  cardTheme: cardTheme,
  elevatedButtonTheme: elevatedButtonThemeData,
  inputDecorationTheme: inputDecorationTheme,
  appBarTheme: appBarTheme,
);
