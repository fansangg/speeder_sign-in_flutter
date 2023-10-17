import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speeder_sign_flutter/home/home_item_bean.dart';
import 'package:speeder_sign_flutter/route/route_config.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Get.toNamed(MyRouteConfig.history);
          },
          child: const Text(
            'Home',
            style: TextStyle(color: Color(0xffd8d8d8)),
          ),
        ),
        backgroundColor: const Color(0xff181818),
      ),
      body: Obx(() {
        return logic.loadingState.value
            ? loading()
            : Column(
                children: [
                  SizedBox.fromSize(
                    size: const Size(0, 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(child: Obx(() => infoCard(Icons.access_time_filled, logic.vipTime.value))),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(child: Obx(() => infoCard(Icons.ac_unit, logic.usage.value))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                    child: Row(
                      children: [
                        Expanded(child: Obx(() => infoCard(Icons.account_box_sharp, logic.online.value))),
                        const SizedBox(
                          width: 12,
                        ),
                        Expanded(child: Obx(() => infoCard(Icons.wallet, logic.wallet.value)))
                      ],
                    ),
                  ),
                ],
              );
      }),
      floatingActionButton: checkBtn(),
    );
  }

  Widget loading() {
    return const SizedBox.expand(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget infoCard(IconData icon, HomeItemBean bean) {
    return Card(
      elevation: 10,
      color: const Color(0xff242424),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 40,
                      color: Colors.lightBlue,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bean.title ?? "",
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xff5d5d5d)),
                          ),
                          Text(
                            bean.value ?? "",
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffd8d8d8)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF616b8f),
                  ),
                  child: Center(
                    child: Text(
                      bean.des ?? "",
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white54),
                      maxLines: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _newsItem(String content) {
    return Card(
      color: const Color(0xff242424),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          content,
          style: const TextStyle(color: Color(0xff5d5d5d), fontSize: 15),
        ),
      ),
    );
  }

  Widget checkBtn() {
    return Obx(() {
      return FloatingActionButton.extended(
        onPressed: () => logic.checkIn(),
        label: Text(logic.checkState.value ? "签到" : "已签到"),
        icon: const Icon(Icons.check_circle_rounded),
        backgroundColor: const Color(0xFF616b8f),
      );
    });
  }
}
