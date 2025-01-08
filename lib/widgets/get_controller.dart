import 'package:flutter/material.dart';
import 'package:get/get.dart';

// class CountController extends GetxController {
//   RxString counts = "08".obs;

//   RxInt seletindex = 0.obs;

//   dynamic onChangedScreen(var index) {
//     seletindex.value = index;
//   }
//   final _contt = PageController().obs;
//   void onitemchange(var i) {
//     _contt.value.jumpToPage(i);
//   }
// }
class CountController extends GetxController {
  RxString counts = "08".obs; // Reactive string
  RxInt seletindex = 0.obs; // Reactive integer
  final PageController pageController = PageController(); // Regular instance

  // Updates the selected index
  void onChangedScreen(int index) {
   seletindex.value = index; // Correctly updates the RxInt value
  }

  // Navigates to the specified page
  void onItemChange(int pageIndex) {
    pageController.jumpToPage(pageIndex); // Uses PageController directly
  }
}

