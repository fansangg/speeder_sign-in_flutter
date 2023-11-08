import 'dart:io';

import 'package:dio/dio.dart' as d;
import 'package:drift/drift.dart' as v;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:logger/logger.dart';
import 'package:speeder_sign_flutter/home/home_item_bean.dart';
import 'package:speeder_sign_flutter/home/home_news_bean.dart';
import 'package:speeder_sign_flutter/home/sigin_state.dart';
import 'package:speeder_sign_flutter/http/http.dart';
import 'package:speeder_sign_flutter/route/route_config.dart';
import 'package:speeder_sign_flutter/util/common_util.dart';

import '../db/db_helper.dart';
import '../db/speeder_datebase.dart';

class HomeLogic extends GetxController {
  var vipTime = HomeItemBean().obs;
  var usage = HomeItemBean().obs;
  var online = HomeItemBean().obs;
  var wallet = HomeItemBean().obs;
  var loadingState = true.obs;
  var checkState = false.obs;
  var homeNewsList = <HomeNewsBean>[].obs;

  void getHtml() async {
    try {
      var ret = await dio.get("/user", options: d.Options(followRedirects: false));
      if (ret.statusCode == 200) {
        var userHtml = parse(ret.data);
        _parserNews(userHtml);
        var cardElement = userHtml.querySelectorAll(".col-lg-3.col-md-3.col-sm-12");
        var checkElement = userHtml.querySelector(".btn.btn-icon.icon-left.btn-primary");
        checkElement?.text.contains("每日签到")??false ? checkState.value = true : checkState.value = false;
        autoCheckIn();
        cardElement.asMap().forEach((key, value) {
          switch (key) {
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
        final infos = await DBHelper.infoDao.getOne(DateTime.now().getSimple());
        if (infos.isNotEmpty) {
          final newInfo = infos.first.copyWith(usage: usage.value.des, remain: usage.value.value);
          DBHelper.infoDao.save(newInfo);
          DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: v.Value("已保存信息 ${newInfo.toString()}")));
        } else {
          final info = SpeederEntityCompanion.insert(
              date: DateTime.now().getSimple(), usage: v.Value(usage.value.des ?? ""), remain: v.Value(usage.value.value ?? ""));
          DBHelper.infoDao.save(info);
          DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: v.Value("已保存信息 ${info.toString()}")));
        }
      }
    } on d.DioException catch (e) {
      DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: v.Value("获取首页详情失败 ${e.message}")));
      Logger().d("error -- ${e.message}");
      if (e.response?.statusCode == 302) {
        var ret = await autoLogin();
        if(ret == 200){
          getHtml();
        }else {
          GetStorage().write("isLogin", false);
          Fluttertoast.showToast(msg: "token expired");
          DBHelper.logDao.saveOne(LogEntityCompanion.insert(
              content: const v.Value("登录信息失效")));
          Get.offNamed(MyRouteConfig.login);
        }
      }
    } finally {
      loadingState.value = false;
    }
  }

  void autoCheckIn() {
    if (SignState.isSigin) {
      checkIn();
      Future.delayed(const Duration(seconds: 5), () {
        DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: const v.Value("自动退出")));
        Logger().d("自动退出");
        exitApp();
      });
    }
  }

  void exitApp(){
    2.delay(() => exit(0));
  }

  Future<int> autoLogin() async {
    var formData = d.FormData.fromMap({"email": GetStorage().read<String>("email")??"", "passwd": GetStorage().read<String>("psw")??"", "code": "", "remember_me": "on"});
    var loginRet = await dio.post("auth/login", data: formData,);
    return loginRet.statusCode??0;
  }

  void checkIn() async {
    if (checkState.isTrue) {
      DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: const v.Value("开始签到")));
      var rep = await dio.post("user/checkin");
      if (rep.statusCode == 200) {
        var ret = rep.data;
        if (ret['ret'] == 1) {
          checkState.value = false;
          Fluttertoast.showToast(msg: ret['msg']);
          var reg = RegExp(r'\d+\s?[MB]*');
          var matches = reg.allMatches(ret['msg']);
          if (matches.isEmpty) {
            Logger().d("没有匹配到获取信息");
            DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: const v.Value("没有匹配到流量信息")));
          } else {
            checkState.value = false;
            var value = matches.first.group(0);
            Logger().d("匹配到 $value");
            DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: v.Value("获取到流量 $value")));
            final infos = await DBHelper.infoDao.getOne(DateTime.now().getSimple());
            if (infos.isNotEmpty) {
              final newInfo = infos.first.copyWith(award: value);
              DBHelper.infoDao.save(newInfo);
            }
          }
        } else {
          checkState.value = false;
          DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: const v.Value("今天已经签到过了")));
        }
      }
    }
  }

  void _parserNews(Document userHtml){
    var cardBody = userHtml.getElementsByClassName("card-body")[4];
    var homeNews = HomeNewsBean();
    cardBody.children.asMap().forEach((index, value) {
      if(index == cardBody.children.length - 1 || value.localName == "hr"){
        homeNewsList.add(homeNews);
        homeNews = HomeNewsBean();
      }else{
        if(value.localName == "h3"){
          homeNews.title = value.text;
        }else{
          homeNews.content.add(value.text);
        }
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
    getHtml();
  }

}
