//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:flutter/cupertino.dart';

///@author  fansan
///@version 2023/10/27
///@des     CommonUtil

extension DateExtension on DateTime {
  String getSimple() {
    return "$year-$month-$day";
  }

  String yYYYMMDDHHMMSS() {
    return "$year-$month-$day $hour:$minute:$second";
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
