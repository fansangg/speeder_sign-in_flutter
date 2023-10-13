import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CountPageTowPage extends StatelessWidget {
  CountPageTowPage({Key? key}) : super(key: key);

  final logic = Get.find<CountPageTowLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('second'),
          leading: IconButton(onPressed: () => {Get.back(result: "22222")}, icon: const Icon(Icons.arrow_back))),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            children: [
              Obx(() {
                return Text(
                  logic.inParam.value,
                  style: const TextStyle(fontSize: 16),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              Obx(() {
                return Text("current is ${logic.count.value}");
              })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {logic.increase()},
        child: const Icon(Icons.add),
      ),
    );
  }
}
