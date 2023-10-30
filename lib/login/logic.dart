import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData;
import 'package:get_storage/get_storage.dart';
import 'package:logger/logger.dart';
import 'package:speeder_sign_flutter/dialog/loading.dart';
import 'package:speeder_sign_flutter/http/http.dart';
import 'package:speeder_sign_flutter/login/login_bean.dart';
import 'package:speeder_sign_flutter/route/route_config.dart';
import 'package:drift/drift.dart' as v;

import '../db/db_helper.dart';
import '../db/speeder_datebase.dart';

class LoginLogic extends GetxController {
  var backCount = 0;
  var psw = GetStorage().read<String>("psw")??"";
  var account = GetStorage().read<String>("email")??"";

  void confirmBack() {
    Future.delayed(const Duration(seconds: 2), () {
      backCount = 0;
    });
  }

  void login() async {
    if (account.isEmpty || psw.isEmpty) {
      Fluttertoast.showToast(msg: "用户名或密码不能为空");
      DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: const v.Value("用户名或密码不能为空")));
    } else {
      Get.dialog(loadingDialog("正在登录中.."), barrierDismissible: false);
      DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: const v.Value("正在登录中...")));
      var formData = FormData.fromMap({"email": account, "passwd": psw, "code": "", "remember_me": "on"});

      try {
        Logger().d("email:$account psw:$psw");
        var loginRet = await dio.post("auth/login",
            data: formData,
            options: Options(followRedirects: false, validateStatus: (status) => status != null && status >= 200 && status < 400));
        Get.back();
        if (loginRet.statusCode == 200) {
          var bean = LoginBean.fromJson(json.decode(loginRet.data));
          if (bean.ret == 1) {
            Logger().d("${bean.msg}");
            GetStorage().write("isLogin", true);
            GetStorage().write("email", account);
            GetStorage().write("psw", psw);
            Get.offNamed(MyRouteConfig.home);
            DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: const v.Value("登录成功")));
          } else {
            DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: v.Value("登录失败 ${bean.msg}")));
            Fluttertoast.showToast(msg: bean.msg??"");
          }
        } else {
          DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: v.Value("登录失败 ${loginRet.statusCode}")));
          //var userRet = await dio.get(loginRet.headers['location']![0]);
        }
      } on DioException catch (e) {
        Get.back();
        DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: v.Value("登录失败 ${e.message??""}")));
        Fluttertoast.showToast(msg: e.message??"");
      }
    }
  }

  @override
  void onReady() {
    if(psw.isNotEmpty && account.isNotEmpty){
      login();
      DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: const v.Value("自动登录中..")));
    }
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
