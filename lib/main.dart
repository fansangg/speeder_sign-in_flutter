import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:speeder_sign_flutter/http/http.dart';
import 'package:speeder_sign_flutter/route/route_config.dart';

void main() async {
  await GetStorage.init();
  dio.interceptors.add(LogInterceptor());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'sign',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true,
      ),
      initialRoute: MyRouteConfig.login,
      getPages: MyRouteConfig.routes,
    );
  }
}
