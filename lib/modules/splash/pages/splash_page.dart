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
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 181, 71, 1),
      body: Center(
        child: Image.asset('assets/images/logo.png'),
      ),
    );
  }
}
