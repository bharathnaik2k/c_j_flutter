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
  CountController countController = Get.put(CountController());

  // int seletindex = 0;

  final _contt = PageController();

  // void onChanged(var index) {
  //   seletindex = index;
  // }

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      drawer: const DrawerScreen(),
      appBar: PreferredSize(
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
          child: appbar(),
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          countController.onChangedScreen(index); // Pass the index dynamically
        },
        controller: countController
            .pageController, // Use the controller from CountController
        children: const [
          HomeScreenWidget(),
          ProfissnoalScreenWidget(),
          LeraningScreenWidget(),
        ],
      ),

      // body: PageView(
      //   onPageChanged: countController.onChangedScreen(1),
      //   controller: _contt,
      //   children: const [
      //     HomeScreenWidget(),
      //     ProfissnoalScreenWidget(),
      //     LeraningScreenWidget(),
      //   ],
      // ),
      bottomNavigationBar: Obx(
        () => Container(
          color: Colors.transparent,
          height: 70,
          child: StylishBottomBar(
            backgroundColor: Colors.blueAccent,
            option: AnimatedBarOptions(),
            items: [
              BottomBarItem(
                icon: countController.seletindex.value == 0
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
                icon: countController.seletindex.value == 2
                    ? const Icon(CupertinoIcons.star_fill)
                    : const Icon(CupertinoIcons.star),
                selectedColor: Colors.white,
                unSelectedColor: const Color.fromARGB(255, 185, 185, 185),
                title: const Text('Leraning'),
              ),
            ],
            hasNotch: true,
            elevation: 20,
            currentIndex: countController.seletindex.value,
            notchStyle: NotchStyle.circle,
            onTap: (index) {
              if (index == countController.seletindex.value) return;
              _contt.jumpToPage(index);
              countController.seletindex.value = index;
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countController.onChangedScreen(0);
          countController.onItemChange(1);
          countController.seletindex.value = 1;
        },
        shape: const StadiumBorder(),
        backgroundColor: Colors.blueAccent,
        child: Obx(
          () => Icon(
            countController.seletindex.value == 1
                ? CupertinoIcons.bag_fill
                : CupertinoIcons.bag,
            color: Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  AppBar appbar() {
    return AppBar(
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
              value: countController.counts.value,
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
                countController.counts.value = value!;
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
          onPressed: () =>
              Navigator.of(context).pushNamed("/NotifiactionScreenWidget"),
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
    );
  }
}
