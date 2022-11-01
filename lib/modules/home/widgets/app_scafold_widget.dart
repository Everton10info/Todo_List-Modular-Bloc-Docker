import 'package:flutter/material.dart';
import 'package:todo_list_new/shared/core/app_fonts.dart';

// ignore: must_be_immutable
class AppScafoldWidget extends StatelessWidget {
  Widget? actionAppBar;
  List<Widget>? children;

  AppScafoldWidget({
    super.key,
    required this.children,
    required this.actionAppBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Todo List',
          style: AppFonts.headline24W700.getFont,
        ),
        actions: [actionAppBar ?? const Text('')],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: children ?? [],
        ),
      ),
    );
  }
}
