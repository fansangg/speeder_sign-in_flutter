import 'package:get/get.dart';

import 'logic.dart';

class CountPageTowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CountPageTowLogic());
  }
}
