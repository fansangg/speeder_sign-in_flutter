import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speeder_sign_flutter/count/count_page_one/logic.dart';

class CountPageTowLogic extends GetxController {
  var inParam = "".obs;
  var count = 0.obs;
  final logic = Get.find<CountPageOneLogic>();

  @override
  void onReady() {
    inParam.value = Get.arguments;
    count.value = logic.count.value;
    super.onReady();
  }

  @override
  void onClose() {
    logic.count.value = count.value;
    GetStorage().write("count", count.value);
    super.onClose();
  }

  void increase() {
    count++;
  }
}
