import 'package:code_ju_project/page_view.dart';
import 'package:code_ju_project/widgets/screen_widgets/notifictions_screens/notifiaction_screen.dart';
import 'package:code_ju_project/widgets/screen_widgets/splashscreen_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  GetMaterialApp build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: "varelaRoundRegular",
      ),
      initialRoute: "/SplashScreenWidget",
      routes: {
        "/SplashScreenWidget": (context) => const SplashScreenWidget(),
        "/PageViewWidget": (context) => const PageViewBulider(),
        "/NotifiactionScreenWidget": (context) =>
            const NotificationScreenWidget(),
      },
    );
  }
}
