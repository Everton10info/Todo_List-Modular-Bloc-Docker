import 'package:flutter/material.dart';

class AppElevatedButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final String label;

  const AppElevatedButtonWidget({
    super.key,
    required this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
