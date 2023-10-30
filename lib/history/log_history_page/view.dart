import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speeder_sign_flutter/util/common_util.dart';

import 'controller.dart';

class LogHistoryPage extends StatelessWidget {
  const LogHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LogHistoryPageController());

    return Obx(() {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              _dateHeader(controller.logEntityData[index].createTime.yYYYMMDDHHMMSS()),
              _logContent(controller.logEntityData[index].content),
            ],
          );
        },
        itemCount: controller.logEntityData.length,
      );
    });
  }

  Widget _dateHeader(String date) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12),
        decoration: BoxDecoration(
          color: Theme.of(Get.context!).cardColor,
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
        child: Text(
          date,
          textAlign: TextAlign.center,
          style: const TextStyle(inherit: false, fontSize: 12, color: Colors.white70),
        ),
      ),
    );
  }

  Widget _logContent(String log) {
    return Text(
      log,
      style: Theme.of(Get.context!).textTheme.bodyMedium,
    ).paddingSymmetric(horizontal: 12).marginOnly(top: 8);
  }
}
