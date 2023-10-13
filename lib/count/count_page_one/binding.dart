import 'package:get/get.dart';

import 'logic.dart';

class CountPageOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountPageOneLogic());
  }
}
