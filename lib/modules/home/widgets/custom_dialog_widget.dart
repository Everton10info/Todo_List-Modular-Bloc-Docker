import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final TextEditingController? controller;
  final void Function() callFunction;
  final Widget content;

  const CustomDialog({
    super.key,
    required this.callFunction,
    required this.content,
    this.controller,
  });

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
