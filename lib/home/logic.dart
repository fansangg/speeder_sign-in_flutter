import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:html/dom.dart';
import 'package:html/parser.dart';
import 'package:speeder_sign_flutter/home/home_item_bean.dart';
import 'package:speeder_sign_flutter/home/home_news_bean.dart';
import 'package:speeder_sign_flutter/http/http.dart';
import 'package:speeder_sign_flutter/route/route_config.dart';

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
      var ret = await dio.get("/user", options: Options(followRedirects: false));
      if (ret.statusCode == 200) {
        var userHtml = parse(ret.data);
        _parserNews(userHtml);
        var cardElement = userHtml.querySelectorAll(".col-lg-3.col-md-3.col-sm-12");
        var checkElement = userHtml.querySelector(".btn.btn-icon.icon-left.btn-primary");
        print("每日签到 ---${checkElement?.text}  -- ${checkElement?.text == "每日签到"}");
        checkElement?.text.trim() == "每日签到" ? checkState.value = true : checkState.value = false;
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
      }
    } on DioException catch (e) {
      print("error -- ${e.message}");
      if (e.response?.statusCode == 302) {
        Fluttertoast.showToast(msg: "token expired");
        Get.offNamed(MyRouteConfig.login);
      }
    } finally {
      loadingState.value = false;
    }
  }

  void checkIn() async {
    if (checkState.value) {
      var rep = await dio.post("user/checkin");
      if (rep.statusCode == 200) {
        var ret = rep.data;
        if (ret['ret'] == 0) {
          checkState.value = false;
          Fluttertoast.showToast(msg: ret['msg']);
          var reg = RegExp(r'\d+\s?[MB]*');
          var matches = reg.allMatches(ret['msg']);
          if (matches.isEmpty) {
            print("没有匹配到获取信息 -- 似乎已经签到过了");
          } else {
            var dateTime = {};
            var now = DateTime.now();
            dateTime['date'] = "${now.year}-${now.month}-${now.day}";
            var value = matches.first.group(0);
            print("匹配到 $value");
            dateTime['content'] = value;
            if (GetStorage().hasData("signHistory")) {
              List history = json.decode(GetStorage().read("signHistory"));
              history.add(dateTime);
              GetStorage().write("signHistory", json.encode(history));
            } else {
              GetStorage().write("signHistory", json.encode([dateTime]));
            }
            print(GetStorage().read("signHistory"));
          }
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
