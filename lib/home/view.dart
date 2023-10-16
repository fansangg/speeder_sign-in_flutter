import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speeder_sign_flutter/home/home_item_bean.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(color: Color(0xffd8d8d8)),
        ),
        backgroundColor: const Color(0xff181818),
      ),
      body: Obx(() {
        return logic.loadingState.value
            ? loading()
            : Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
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

  Widget checkBtn(){
    return SizedBox.fromSize(size: const Size(50, 50),child:
        ElevatedButton(onPressed: (){}, child:const Icon(Icons.add_card,color:Color(0xFF616b8f),))
      ,);
  }
}
