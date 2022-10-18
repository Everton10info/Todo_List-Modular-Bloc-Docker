import 'package:flutter/material.dart';

class AppTextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?) validator;

  const AppTextFormFieldWidget({
    super.key,
    required this.controller,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLength: 25,
    );
  }
}
