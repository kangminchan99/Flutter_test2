import 'package:get/get.dart';

import '../controller/business_controller.dart';
import '../controller/nav_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavController());
    Get.lazyPut(() => BusinessController());
  }
}
