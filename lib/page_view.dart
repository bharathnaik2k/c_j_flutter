import 'package:code_ju_project/widgets/screen_widgets/drawer_screen.dart';
import 'package:code_ju_project/widgets/screen_widgets/homescreen_widget.dart';
import 'package:code_ju_project/widgets/screen_widgets/leraning_screen.dart';
import 'package:code_ju_project/widgets/screen_widgets/profissonal_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class PageViewBulider extends StatefulWidget {
  const PageViewBulider({super.key});

  @override
  State<PageViewBulider> createState() => _PageViewBuliderState();
}

class _PageViewBuliderState extends State<PageViewBulider> {
  int seletindex = 0;

  final _contt = PageController();

  void onChanged(var index) {
    setState(() {
      seletindex = index;
    });
  }

  void onitemchange(var i) {
    _contt.jumpToPage(i);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerScreen(),
      body: PageView(
        onPageChanged: onChanged,
        controller: _contt,
        children: const [
          HomeScreenWidget(
            drawerScreen: DrawerScreen(),
          ),
          ProfissnoalScreenWidget(),
          LeraningScreenWidget(),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.transparent,
        height: 70,
        child: StylishBottomBar(
          backgroundColor: Colors.blueAccent,
          option: AnimatedBarOptions(),
          items: [
            BottomBarItem(
              icon: seletindex == 0
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
              icon: seletindex == 2
                  ? const Icon(CupertinoIcons.star_fill)
                  : const Icon(CupertinoIcons.star),
              selectedColor: Colors.white,
              unSelectedColor: const Color.fromARGB(255, 185, 185, 185),
              title: const Text('Leraning'),
            ),
          ],
          hasNotch: true,
          elevation: 20,
          currentIndex: seletindex,
          notchStyle: NotchStyle.circle,
          onTap: (index) {
            if (index == seletindex) return;
            _contt.jumpToPage(index);
            setState(() {
              seletindex = index;
            });
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onChanged(1);
          onitemchange(1);
          setState(() {
            seletindex = 1;
          });
        },
        shape: const StadiumBorder(),
        backgroundColor: Colors.blueAccent,
        child: Icon(
          seletindex == 1 ? CupertinoIcons.bag_fill : CupertinoIcons.bag,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
