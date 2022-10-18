import 'package:flutter/material.dart';

class SnackbarHelper {
  static void show(
    BuildContext context, {
    required String message,
    required Color color,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: color,
      ),
    );
  }
}
