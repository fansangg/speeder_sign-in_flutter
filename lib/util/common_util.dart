//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:flutter/cupertino.dart';

///@author  fansan
///@version 2023/10/27
///@des     CommonUtil

extension DateExtension on DateTime {
  String getSimple() {
    var newDay = day < 10 ? "0$day" : day;
    var newMonth = month < 10 ? "0$month" : month;
    return "$year-$newMonth-$newDay";
  }

  String yYYYMMDDHHMMSS() {
    var newMonth = month < 10 ? "0$month" : month;
    var newDay = day < 10 ? "0$day" : day;
    var newHour = hour < 10 ? "0$hour" : hour;
    var newMinute = minute < 10 ? "0$minute" : minute;
    var newSecond = second < 10 ? "0$second" : second;
    return "$year-$newMonth-$newDay $newHour:$newMinute:$newSecond";
  }
}

extension WidgetExt on Widget {
  Widget padding(EdgeInsetsGeometry edgeInsetsGeometry) {
    return Padding(
      padding: edgeInsetsGeometry,
      child: this,
    );
  }
}
