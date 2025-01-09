import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CountController extends GetxController {
  RxString counts = "08".obs;
  RxInt seletindex = 0.obs;
  RxInt notiSeleteIndex = 0.obs;
  final PageController pageController = PageController();
  final PageController contt = PageController();

  void onChangedScreen(int index) {
    seletindex.value = index;
  }

  void onItemChange(int pageIndex) {
    pageController.jumpToPage(pageIndex);
  }

  void onChanged(int index) {
    notiSeleteIndex.value = index;
  }

  void onitemchange(int i) {
    contt.jumpToPage(i);
  }
}
