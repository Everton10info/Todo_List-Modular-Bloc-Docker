import 'package:flutter/material.dart';

import '../../../shared/core/app_fonts.dart';

// ignore: must_be_immutable
class AppScafoldWidget extends StatelessWidget {
  Widget? actionAppBar;
  List<Widget>? children;
  String title;

  AppScafoldWidget({
    super.key,
    required this.children,
    required this.actionAppBar,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: AppFonts.headline24Bold.getFont,
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
