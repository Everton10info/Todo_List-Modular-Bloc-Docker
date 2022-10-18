import 'package:flutter/material.dart';

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
    return ListTile(
      title: Text(title),
      leading: Checkbox(
        value: valueCheckBox,
        onChanged: onChanged,
      ),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: onPressedEdit,
              icon: const Icon(Icons.create_sharp),
            ),
            IconButton(
              onPressed: onPressedDelete,
              icon: const Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
