import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pos_laundry/app/core/values/colors.dart';

import 'text_theme.dart';

AppBarTheme appBarTheme = AppBarTheme(
  elevation: 0,
  backgroundColor: Colors.white,
  centerTitle: true,
  iconTheme: const IconThemeData(
    color: black,
  ),
  titleTextStyle: bold.copyWith(
    color: black,
  ),
  systemOverlayStyle: const SystemUiOverlayStyle(
    statusBarColor: primaryColor, // Status bar
  ),
);
