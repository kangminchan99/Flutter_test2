import 'package:get/get.dart';

enum PageName { Business, Tesla }

class NavController extends GetxController {
  static NavController get to => Get.find();
  RxInt pageIndex = 0.obs;

  void changePageIndex(int index) {
    pageIndex.value = index;
  }
}
