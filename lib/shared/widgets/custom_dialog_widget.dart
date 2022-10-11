// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EditionDialog extends StatelessWidget {
  EditionDialog({
    super.key,
    this.controller,
    this.callFunction,
    this.message,
  });
  TextEditingController? controller;
  void Function()? callFunction;
  String? message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: TextField(
        style: const TextStyle(fontSize: 20),
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: () {
            callFunction!();
            Modular.to.pop();
          },
          child: const Text('OK'),
        )
      ],
    );
  }
}
