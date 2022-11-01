import 'package:flutter/material.dart';

import '../../../shared/core/app_fonts.dart';

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
    return SizedBox(
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: AppFonts.body16W700.getFont,
        ),
      ),
    );
  }
}
