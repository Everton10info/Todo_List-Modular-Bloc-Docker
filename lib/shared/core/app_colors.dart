import 'package:flutter/material.dart';

const primaryColor = MaterialColor(
  0xffffb547,
  <int, Color>{
    50: Color(0xFFFFF3E0),
    100: Color(0xFFFFE0B2),
    200: Color(0xFFFFCC80),
    300: Color(0xFFFFB74D),
    400: Color(0xFFFFA726),
    500: Color(0xffffb547),
    600: Color(0xFFFB8C00),
    700: Color(0xFFF57C00),
    800: Color(0xFFEF6C00),
    900: Color(0xFFE65100),
  },
);

enum AppColors {
  black,
  green,
  grey,
  orange,
  red,
  white,
}

extension AppColorsExtension on AppColors {
  Color get getColor {
    switch (this) {
      case AppColors.black:
        return const Color(0xff000000);
      case AppColors.orange:
        return const Color(0xffffb547);
      case AppColors.green:
        return const Color(0xff62c785);
      case AppColors.red:
        return const Color(0xffff8484);
      case AppColors.white:
        return const Color(0xffffffff);
      case AppColors.grey:
        return const Color(0xffc7c7c7);
      default:
        return const Color(0xff000000);
    }
  }
}
