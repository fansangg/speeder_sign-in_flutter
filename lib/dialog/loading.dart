//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

///@author  fansan
///@version 2023/10/13
///@des     loading
///
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget loadingDialog(String title) {
  return WillPopScope(child: Center(
    child: SizedBox.fromSize(
      size: Size(Get.width * 0.6, 100),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(
                height: 12,
              ),
              Text(title, style: TextStyle(inherit: false,color: Colors.black,fontSize: 12))
            ],
          ),
        ),
      ),
    ),
  ), onWillPop: () async {
    return false;
  });
}
