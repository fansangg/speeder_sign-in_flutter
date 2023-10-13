import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final logic = Get.find<HomeLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
            child: Row(
              children: [
                Expanded(child: infoCard(Icons.access_time_filled, "会员时长", "222天", "高级会员：2023-11-11")),
                const SizedBox(
                  width: 24,
                ),
                Expanded(child: infoCard(Icons.access_time_filled, "会员时长", "222天", "高级会员：2023-11-11")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard(IconData icon, String title, String content, String des) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 15, 12, 15),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    size: 80,
                    color: Colors.lightBlue,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black38),
                        ),
                        Text(
                          content,
                          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    color: Colors.blueGrey[200],
                    child: Text(
                      des,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
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
}
