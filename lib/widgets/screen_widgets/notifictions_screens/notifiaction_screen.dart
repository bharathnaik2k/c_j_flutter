import 'package:code_ju_project/widgets/get_controller.dart';
import 'package:code_ju_project/widgets/screen_widgets/notifictions_screens/noti_page_view/all_screen.dart';
import 'package:code_ju_project/widgets/screen_widgets/notifictions_screens/noti_page_view/importent_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NotificationScreenWidget extends StatefulWidget {
  const NotificationScreenWidget({super.key});

  @override
  State<NotificationScreenWidget> createState() =>
      _NotificationScreenWidgetState();
}

class _NotificationScreenWidgetState extends State<NotificationScreenWidget> {
  CountController getxController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(CupertinoIcons.xmark),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Opacity(
                    opacity: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert),
                    ),
                  ),
                  const Center(
                    child: Text(
                      "Notifications",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_vert),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        getxController.onChanged(0);
                        getxController.onitemchange(0);
                        getxController.notiSeleteIndex.value = 0;
                      },
                      child: const Text(
                        " All ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Obx(
                      () => Container(
                        height: 3,
                        width: 19,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: getxController.notiSeleteIndex.value == 0
                                ? Colors.pink
                                : Colors.transparent),
                      ),
                    )
                  ],
                ),
                const SizedBox(width: 20),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        getxController.onChanged(1);
                        getxController.onitemchange(1);
                        getxController.notiSeleteIndex.value = 1;
                      },
                      child: const Text(
                        "Importent",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Obx(
                      () => Container(
                        height: 3,
                        width: 67,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: getxController.notiSeleteIndex.value == 1
                                ? Colors.pink
                                : Colors.transparent),
                      ),
                    )
                  ],
                ),
              ],
            ),
            const Divider(),
            Expanded(
              child: PageView(
                controller: getxController.contt,
                onPageChanged: (index) => getxController.onChanged(index),
                children: const [
                  AllScreenWidget(),
                  ImportantScreenWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
