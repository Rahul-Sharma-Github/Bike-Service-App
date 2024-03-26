import 'package:get/get.dart';

class BottomNavigationController extends GetxController {
  // tabIndex to show a specific page according to it's value
  var tabIndex = 0.obs;

  // method to change tabIndex value on tap of icon of BottomNavigationBar
  void changeTabIndex(int index) {
    tabIndex.value = index;
  }
}
