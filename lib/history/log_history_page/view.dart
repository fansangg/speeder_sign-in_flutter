import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class LogHistoryPage extends StatelessWidget {
  const LogHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogHistoryPageController());
    final state = Get.find<LogHistoryPageController>().state;

    return Container();
  }
}
