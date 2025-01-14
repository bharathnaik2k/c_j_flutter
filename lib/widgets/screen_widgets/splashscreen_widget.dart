import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({super.key});

  //this Fun. Navigate Splash Screen(after 2 second) To Home Screen
  _naviScreenFun(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () async {
      await Get.toNamed("/PageViewWidget");
    });
  }

  @override
  Widget build(BuildContext context) {
    _naviScreenFun(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 237, 251, 175),
      body: body(),
    );
  }

  Center body() {
    return const Center(
        child: Icon(
      Icons.phone_android,
      size: 65,
    ));
  }
}
