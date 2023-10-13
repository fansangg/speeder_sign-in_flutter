//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:dio/dio.dart';

///@author  fansan
///@version 2023/10/13
///@des     http 

final dio = Dio(
  BaseOptions(
    baseUrl: "https://www.speeder.one/",
    receiveTimeout: Duration(seconds: 10),
    connectTimeout: Duration(seconds: 10),
  )
);


 

