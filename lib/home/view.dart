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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {
              Get.toNamed(MyRouteConfig.history);
            },
            child: Text(
              'Home',
              style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          backgroundColor: Theme.of(Get.context!).primaryColor,
        ),
        body: Obx(() {
          return logic.loadingState.value
              ? loading()
              : ListView.builder(
            itemBuilder: (context, index) {
              if (index == 0) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: infoCard(Icons.access_time_filled, logic.vipTime.value)),
                        Expanded(child: infoCard(Icons.ac_unit, logic.usage.value)),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: infoCard(Icons.account_box_sharp, logic.online.value)),
                        Expanded(child: infoCard(Icons.wallet, logic.wallet.value))
                      ],
                    ),
                  ],
                );
              } else if (index == 1) {
                return Container(
                  height: 30,
                  alignment: Alignment.center,
                  child: Text(
                    "公告",
                    style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
                  ),
                );
              } else {
                var bean = logic.homeNewsList[index - 2];
                return _newsItem(bean.title ?? "", bean.content.join());
              }
            },
            itemCount: logic.homeNewsList.length + 2,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
          );
        }),
        floatingActionButton: Obx(() {
          return Visibility(visible: logic.loadingState.isFalse, child: checkBtn());
        })
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
      color: Theme.of(Get.context!).cardColor,
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
                      color: Theme.of(Get.context!).primaryColorDark,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            bean.title ?? "",
                            style: Theme.of(Get.context!).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            bean.value ?? "",
                            style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
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
                    color: Theme.of(Get.context!).primaryColorDark,
                  ),
                  child: Center(
                    child: Text(
                      bean.des ?? "",
                      style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold,fontSize: 10),
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

  Widget _newsItem(String title, String content) {
    return Card(
      color: Theme.of(Get.context!).cardColor,
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              title,
              style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              content,
              style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkBtn() {
    return FloatingActionButton.extended(
      onPressed: () => logic.checkIn(),
      label: Text(logic.checkState.value ? "签到" : "已签到",style: Theme.of(Get.context!).textTheme.bodySmall,),
      icon: const Icon(Icons.check_circle_rounded),
      backgroundColor: Theme.of(Get.context!).primaryColorDark,
    );
  }
}
