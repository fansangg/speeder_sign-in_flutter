import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speeder_sign_flutter/route/route_config.dart';

class CountPageOneLogic extends GetxController {
  var count = 0.obs;
  var title = "Home".obs;

  @override
  void onReady() {
    count.value = GetStorage().read("count") ?? 0;
    super.onReady();
  }

  @override
  void onClose() {
    GetStorage().write("count", count.value);
    super.onClose();
  }

  void increase(){
    count++;
  }

  void jump() async {
    var ret = await Get.toNamed(MyRouteConfig.pageTow,arguments: "1111111");
    title.value = ret;
  }
}
