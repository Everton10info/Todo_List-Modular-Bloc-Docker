// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  CustomDialog({
    super.key,
    required this.callFunction,
    required this.content,
  });
  TextEditingController? controller;
  void Function() callFunction;
  Widget content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color.fromARGB(255, 229, 220, 192),
      content: content,
      actions: [
        TextButton(
          onPressed: () {
            callFunction();
          },
          child: const Text(
            'OK',
            style: TextStyle(fontSize: 20),
          ),
        )
      ],
    );
  }
}
