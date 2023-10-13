import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class CountPageOnePage extends StatelessWidget {
  CountPageOnePage({Key? key}) : super(key: key);

  final logic = Get.find<CountPageOneLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() {
          return Text(logic.title.value);
        }),
        actions: [
          ElevatedButton.icon(onPressed: () => {logic.jump()}, icon: const Icon(Icons.forward), label: const Text("jump"))
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Obx(() {
            return Text("current == ${logic.count.value}");
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.increase(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
