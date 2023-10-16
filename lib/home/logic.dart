import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:speeder_sign_flutter/home/home_item_bean.dart';
import 'package:speeder_sign_flutter/http/http.dart';
import 'package:html/parser.dart';
import 'package:speeder_sign_flutter/route/route_config.dart';

class HomeLogic extends GetxController {

  var vipTime = HomeItemBean().obs;
  var usage = HomeItemBean().obs;
  var online = HomeItemBean().obs;
  var wallet = HomeItemBean().obs;
  var loadingState = true.obs;
  var checkState = false.obs;

  void getHtml() async {
    try {
      var ret = await dio.get("/user",options: Options(followRedirects: false));
      if(ret.statusCode == 200){
            var userHtml = parse(ret.data);
            var cardElement = userHtml.querySelectorAll(".col-lg-3.col-md-3.col-sm-12");
            var checkElement = userHtml.querySelector(".btn.btn-icon.icon-left.btn-primary");
            checkElement?.text == "每日签到" ? checkState.value = true : checkState.value = false;
            cardElement.asMap().forEach((key, value) { 
              switch(key){
                case 0:
                  vipTime.value.title = value.querySelector(".card-header")?.text.trim();
                  vipTime.value.value = value.querySelector(".card-body")?.text.trim();
                  vipTime.value.des = value.querySelector(".card-stats")?.text.replaceAll(RegExp(r"\s+"), "");
                case 1:
                  usage.value.title = value.querySelector(".card-header")?.text.trim();
                  usage.value.value = value.querySelector(".card-body")?.text.trim();
                  usage.value.des = value.querySelector(".card-stats")?.text.trim();
                case 2:
                  online.value.title = value.querySelector(".card-header")?.text.trim();
                  online.value.value = value.querySelector(".card-body")?.text.trim();
                  online.value.des = value.querySelector(".card-stats")?.text.trim();
                case 3:
                  wallet.value.title = value.querySelector(".card-header")?.text.trim();
                  wallet.value.value = value.querySelector(".card-body")?.text.trim();
                  wallet.value.des = value.querySelector(".card-stats")?.text.trim();
              }
            });
      }
    } on DioException catch (e) {
      print("error -- ${e.message}");
      if (e.response?.statusCode == 302){
        Fluttertoast.showToast(msg: "token expired");
        Get.offNamed(MyRouteConfig.login);
      }
    } finally{
      loadingState.value = false;
    }
  }


  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    getHtml();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
