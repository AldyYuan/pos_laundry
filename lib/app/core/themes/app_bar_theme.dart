import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_laundry/app/core/values/colors.dart';

import 'text_theme.dart';

const AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0,
  backgroundColor: Colors.white,
  centerTitle: true,
  titleTextStyle: bold,
  systemOverlayStyle: SystemUiOverlayStyle(
    statusBarColor: primaryColor, // Status bar
  ),
);
