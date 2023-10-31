import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speeder_sign_flutter/db/speeder_datebase.dart';

import 'controller.dart';

class InfoHistoryPgae extends StatelessWidget {
  const InfoHistoryPgae({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(InfoHistoryPgaeController());

    return Column(
      children: [
        _header(context),
        Obx(() {
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return _history(controller.historyList[index], index, controller.historyList.length);
              },
              itemExtent: 60,
              itemCount: controller.historyList.length,
            ).paddingSymmetric(vertical: 8),
          );
        }),
      ],
    );
  }

  Widget _header(BuildContext context) {
    return SizedBox(
        height: 40,
        child: Row(
          children: [
            Expanded(
              child: Text(
                "日期",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                "已使用",
                style: Theme.of(Get.context!).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                "剩余",
                style: Theme.of(Get.context!).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Text(
                "获得",
                style: Theme.of(Get.context!).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ));
  }

  Widget _history(SpeederEntityData data, int index, int count) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          Expanded(child: _historyRowCell(index, 0,data.date, count)),
          Expanded(child: _historyRowCell(index, 1,data.usage, count)),
          Expanded(child: _historyRowCell(index, 2,data.remain, count)),
          Expanded(child: _historyRowCell(index, 3,data.award, count)),
        ],
      ),
    );
  }

  Widget _historyRowCell(int index, int cellIndex,String content, int count) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Theme.of(Get.context!).dividerColor ,width: index == 0 ? 1 : 0.5),
          left: BorderSide(color: Theme.of(Get.context!).dividerColor, width:cellIndex == 0 ? 1 : 0.5),
          right: BorderSide(color: Theme.of(Get.context!).dividerColor, width: cellIndex == 3 ? 1 : 0.5),
          bottom: BorderSide(color: Theme.of(Get.context!).dividerColor, width: index == count - 1 ? 1 : 0.5),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        content,
        style: Theme.of(Get.context!).textTheme.bodyMedium,
        textAlign: TextAlign.center,
      ),
    );
  }
}
