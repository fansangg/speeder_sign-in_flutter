import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class InfoHistoryPgae extends StatelessWidget {
  const InfoHistoryPgae({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InfoHistoryPgaeController());
    final state = Get.find<InfoHistoryPgaeController>().state;

    return Container(
      color: Colors.red,
    );
  }
}
