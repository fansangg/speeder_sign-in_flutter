import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:speeder_sign_flutter/dialog/loading.dart';
import 'package:speeder_sign_flutter/http/http.dart';
import 'package:speeder_sign_flutter/login/login_bean.dart';
import 'package:speeder_sign_flutter/route/route_config.dart';

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
      var formData = FormData.fromMap({"email": account, "passwd": psw, "code": "", "remember_me": "on"});

      try {
        debugPrint("email:$account psw:$psw");
        var loginRet = await dio.post("auth/login",
            data: formData,
            options: Options(followRedirects: false, validateStatus: (status) => status != null && status >= 200 && status < 400));
        Get.back();
        if (loginRet.statusCode == 200) {
          var bean = LoginBean.fromJson(json.decode(loginRet.data));
          if (bean.ret == 1) {
            debugPrint("${bean.msg}");
            GetStorage().write("isLogin", true);
            Get.offNamed(MyRouteConfig.home);
          } else {
            Get.snackbar('', '${bean.msg}', titleText: null, backgroundColor: Colors.white);
          }
        } else {
          //var userRet = await dio.get(loginRet.headers['location']![0]);
        }
      } on DioException catch (e) {
        Get.back();
        Get.snackbar('', '${e.message}', titleText: null, backgroundColor: Colors.white);
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
