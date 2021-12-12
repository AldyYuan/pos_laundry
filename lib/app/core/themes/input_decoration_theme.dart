import 'package:flutter/material.dart';
import 'package:pos_laundry/app/core/values/colors.dart';

InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
  focusColor: primaryColor,
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(20.0),
    borderSide: const BorderSide(
      color: grey,
      width: 1,
    ),
  ),
);
