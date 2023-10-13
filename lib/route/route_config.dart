//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:get/get.dart';
import 'package:speeder_sign_flutter/count/count_page_one/binding.dart';
import 'package:speeder_sign_flutter/count/count_page_one/view.dart';
import 'package:speeder_sign_flutter/count/count_page_tow/binding.dart';
import 'package:speeder_sign_flutter/count/count_page_tow/view.dart';
import 'package:speeder_sign_flutter/login/binding.dart';
import 'package:speeder_sign_flutter/login/view.dart';

///@author  fansan
///@version 2023/10/12
///@des     route_config

class MyRouteConfig {
  static const root = "/";
  static const pageTow = "/page2";

  static const login = "/login";

  static final List<GetPage<dynamic>> routes = [
    GetPage(name: root, page: () => CountPageOnePage(), binding: CountPageOneBinding()),
    GetPage(name: pageTow, page: () => CountPageTowPage(), binding: CountPageTowBinding()),
    GetPage(name: login, page: () => LoginPage(), binding: LoginBinding()),
  ];
}
