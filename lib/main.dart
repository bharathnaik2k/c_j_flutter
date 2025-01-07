import 'package:code_ju_project/page_view.dart';
import 'package:code_ju_project/widgets/screen_widgets/notifiaction_screen.dart';
import 'package:code_ju_project/widgets/screen_widgets/splashscreen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.black,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "varelaRoundRegular",
      ),
      initialRoute: "/SplashScreenWidget",
      routes: {
        "/PageViewWidget": (context) => const PageViewBulider(),
        "/SplashScreenWidget": (context) => const SplashScreenWidget(),
        "/NotifiactionScreenWidget": (context) =>
            const NotificationScreenWidget(),
      },
    );
  }
}
