import 'package:flutter/material.dart';

import '../../../shared/core/app_colors.dart';
import '../../../shared/core/app_fonts.dart';

class AppListTileWidget extends StatelessWidget {
  final String title;
  final bool valueCheckBox;
  final void Function(bool?) onChanged;
  final void Function() onPressedEdit;
  final void Function() onPressedDelete;

  const AppListTileWidget({
    super.key,
    required this.title,
    required this.valueCheckBox,
    required this.onChanged,
    required this.onPressedEdit,
    required this.onPressedDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.orange.getColor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Transform.scale(
                    scale: 0.8,
                    child: Checkbox(
                      fillColor: MaterialStateColor.resolveWith(
                        (states) => AppColors.black.getColor,
                      ),
                      checkColor: primaryColor,
                      value: valueCheckBox,
                      onChanged: onChanged,
                    ),
                  ),
                  Text(
                    title,
                    style: AppFonts.caption14W400.getFont,
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(
                    color: AppColors.white.getColor,
                    onPressed: onPressedEdit,
                    icon: const Icon(Icons.create_sharp),
                    iconSize: 18,
                  ),
                  IconButton(
                    color: AppColors.white.getColor,
                    onPressed: onPressedDelete,
                    icon: const Icon(Icons.delete),
                    iconSize: 18,
                  ),
                ],
              )
            ],
          )),
    );
  }
}
