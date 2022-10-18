import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _loadPage();
    super.initState();
  }

  _loadPage() {
    Future.delayed(const Duration(seconds: 2))
        .then((value) => Modular.to.navigate('/home/'));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 128,
        ),
      ),
    );
  }
}
