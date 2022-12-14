import 'package:flutter/material.dart';

import '../../../shared/core/app_colors.dart';
import '../../../shared/core/app_fonts.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;
  final String? label;

  const AppTextFormFieldWidget({
    super.key,
    required this.controller,
    required this.validator,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 16,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color: AppColors.grey.getColor),
      ),
      style: AppFonts.caption16W400.getFont,
      controller: controller,
      validator: validator,
    );
  }
}
