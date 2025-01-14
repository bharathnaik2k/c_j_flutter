import 'package:code_ju_project/widgets/get_controller.dart';
import 'package:code_ju_project/widgets/screen_widgets/drawer_screen.dart';
import 'package:code_ju_project/widgets/screen_widgets/homescreen_widget.dart';
import 'package:code_ju_project/widgets/screen_widgets/leraning_screen.dart';
import 'package:code_ju_project/widgets/screen_widgets/profissonal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class PageViewBulider extends StatefulWidget {
  const PageViewBulider({super.key});

  @override
  State<PageViewBulider> createState() => _PageViewBuliderState();
}

class _PageViewBuliderState extends State<PageViewBulider> {
  CountController getxController = Get.put(CountController());

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpened = MediaQuery.of(context).viewInsets.bottom != 0.0;
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: appBar(),
      body: pageView(),
      bottomNavigationBar: bottomNaviBar(),
      floatingActionButton: keyboardIsOpened ? null : flotingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  PageView pageView() {
    return PageView(
      onPageChanged: (index) => getxController.onChangedScreen(index),
      controller: getxController.pageController,
      children: const [
        HomeScreenWidget(),
        ProfissnoalScreenWidget(),
        LeraningScreenWidget(),
      ],
    );
  }

  FloatingActionButton flotingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        getxController.onChangedScreen(0);
        getxController.onItemChange(1);
        getxController.seletindex.value = 1;
      },
      shape: const StadiumBorder(),
      backgroundColor: Colors.blueAccent,
      child: Obx(
        () => Icon(
          getxController.seletindex.value == 1
              ? CupertinoIcons.bag_fill
              : CupertinoIcons.bag,
          color: Colors.white,
        ),
      ),
    );
  }

  Obx bottomNaviBar() {
    return Obx(
      () => Container(
        color: Colors.transparent,
        height: 70,
        child: StylishBottomBar(
          backgroundColor: Colors.blueAccent,
          option: AnimatedBarOptions(),
          items: [
            BottomBarItem(
              icon: getxController.seletindex.value == 0
                  ? const Icon(CupertinoIcons.house_fill)
                  : const Icon(CupertinoIcons.house),
              selectedColor: Colors.white,
              unSelectedColor: const Color.fromARGB(255, 185, 185, 185),
              title: const Text('Home'),
            ),
            BottomBarItem(
              icon: const Icon(Icons.remove),
              selectedColor: Colors.white,
              unSelectedColor: const Color.fromARGB(255, 185, 185, 185),
              title: const Text(
                'Professeional',
                style: TextStyle(fontSize: 13),
              ),
            ),
            BottomBarItem(
              icon: getxController.seletindex.value == 2
                  ? const Icon(CupertinoIcons.star_fill)
                  : const Icon(CupertinoIcons.star),
              selectedColor: Colors.white,
              unSelectedColor: const Color.fromARGB(255, 185, 185, 185),
              title: const Text('Leraning'),
            ),
          ],
          hasNotch: true,
          elevation: 20,
          currentIndex: getxController.seletindex.value,
          notchStyle: NotchStyle.circle,
          onTap: (index) {
            if (index == getxController.seletindex.value) return;
            getxController.pageController.jumpToPage(index);
            getxController.seletindex.value = index;
          },
        ),
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 22, 115, 191),
            ],
          ),
        ),
        child: AppBar(
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(CupertinoIcons.line_horizontal_3),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          titleSpacing: 0,
          backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white, size: 32),
          title: Row(
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Center(
                  child: Icon(
                    size: 24,
                    Icons.local_fire_department,
                    color: Colors.red,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Obx(
                () => DropdownButton(
                  value: getxController.counts.value,
                  dropdownColor: Colors.white,
                  hint: const Text(
                    "08",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: 22,
                    ),
                  ),
                  underline: Container(color: Colors.white),
                  items: const [
                    DropdownMenuItem(
                      value: "08",
                      child: Text(
                        "08",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "09",
                      child: Text(
                        "09",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    DropdownMenuItem(
                      value: "10",
                      child: Text(
                        "10",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ],
                  onChanged: (value) {
                    getxController.counts.value = value!;
                  },
                ),
              ),
            ],
          ),
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Text(
                    "Statistics",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 6),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                    size: 13,
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {
                getxController.notiSeleteIndex.value = 0;
                Get.toNamed("/NotifiactionScreenWidget");
              },
              style: const ButtonStyle(
                padding: MaterialStatePropertyAll(EdgeInsets.zero),
                backgroundColor: MaterialStatePropertyAll(Colors.white),
              ),
              icon: const Icon(
                CupertinoIcons.bell,
                size: 22,
              ),
              color: Colors.black,
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
    );
  }
}
