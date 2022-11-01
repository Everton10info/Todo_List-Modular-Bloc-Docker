import 'package:flutter/material.dart';

enum AppFonts {
  caption14W400,
  caption16W400,
  body16W700,
  headline24W700,
  headline24Bold
}

extension AppFontsExtension on AppFonts {
  // caption16W400,
  // body16W700,
  // headline24W700,
  // headline24Bold
  TextStyle get getFont {
    switch (this) {
      case AppFonts.caption14W400:
        return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );
      case AppFonts.caption16W400:
        return const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
        );
      case AppFonts.body16W700:
        return const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        );
      case AppFonts.headline24W700:
        return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
        );
      case AppFonts.headline24Bold:
        return const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        );
    }
  }
}
