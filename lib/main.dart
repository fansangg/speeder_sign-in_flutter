import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:drift/drift.dart' as v;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speeder_sign_flutter/db/db_helper.dart';
import 'package:speeder_sign_flutter/db/speeder_datebase.dart';
import 'package:speeder_sign_flutter/home/sigin_state.dart';
import 'package:speeder_sign_flutter/http/http.dart';
import 'package:speeder_sign_flutter/route/route_config.dart';

void main() async {
  await GetStorage.init();
  DBHelper.initDb();
  Directory dir = await getApplicationDocumentsDirectory();
  PersistCookieJar cookieJar = PersistCookieJar(storage: FileStorage(dir.path));
  dio.interceptors.add(CookieManager(cookieJar));
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    _initChannel();
    return GetMaterialApp(
      title: 'sign',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true),
      initialRoute: GetStorage().read<bool>("isLogin") ?? false ? MyRouteConfig.home : MyRouteConfig.login,
      getPages: MyRouteConfig.routes,
    );
  }

  void _initChannel() {
    var channel = const MethodChannel("toFlutter");
    channel.setMethodCallHandler((call) => flutterMethod(call));
  }

  Future<dynamic> flutterMethod(MethodCall call) async {
    if (call.method == "signin") {
      SignState.isSigin = true;
      DBHelper.logDao.saveOne(LogEntityCompanion.insert(content: const v.Value("来自shortcuts")));
    }
  }
}
