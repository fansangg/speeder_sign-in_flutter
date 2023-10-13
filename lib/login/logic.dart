import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:speeder_sign_flutter/dialog/loading.dart';
import 'package:speeder_sign_flutter/http/http.dart';

class LoginLogic extends GetxController {
  var backCount = 0;
  var psw = "";
  var account = "";

  void confirmBack() {
    Future.delayed(const Duration(seconds: 2), () {
      backCount = 0;
    });
  }

  void login() async {
    if (account.isEmpty || psw.isEmpty) {
      Get.snackbar('', '用户名或密码不能为空', titleText: null, backgroundColor: Colors.white);
    } else {
      Get.dialog(loadingDialog("正在登录中.."), barrierDismissible: false);
      var data = FormData.fromMap({"email": account, "psw": psw, "code": "", "remember_me": "on"});

      try {
        var reponse = await dio.post("auth/login", data: data);
        if (reponse.statusCode == 200) {
          print(reponse.data);
          Get.back();
        }
      } catch (e) {
        Get.back();
      }
    }
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
