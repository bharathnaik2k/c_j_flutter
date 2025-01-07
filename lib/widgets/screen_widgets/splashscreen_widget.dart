import 'package:flutter/material.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  //this Fun. Navigate Splash Screen(after 2 second) To Home Screen
  _naviScreenFun(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed("/PageViewWidget");
    });
  }

  @override
  Widget build(BuildContext context) {
    _naviScreenFun(context);
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 255, 64),
      body: Center(
        child: Icon(Icons.android, size: 40),
      ),
    );
  }
}
