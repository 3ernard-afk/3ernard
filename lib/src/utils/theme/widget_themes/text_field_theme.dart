import 'package:flutter/material.dart';
import 'package:login_flutter_app/src/constants/colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: tSecondaryColor,
      floatingLabelStyle: const TextStyle(color: tSecondaryColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(width: 2, color: tSecondaryColor),
      ));

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      prefixIconColor: tPrimaryColor,
      floatingLabelStyle: const TextStyle(color: tPrimaryColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(width: 2, color: tPrimaryColor),
      ));
}
