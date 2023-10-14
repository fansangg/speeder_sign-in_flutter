import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
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
      color: const Color(0xff242424),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 130,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
          child: Column(
            children: [
              Flexible(
                flex: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      icon,
                      size: 50,
                      color: Colors.lightBlue,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xff5d5d5d)),
                          ),
                          Text(
                            content,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xffd8d8d8)),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color(0xFF616b8f),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  child: Text(
                    des,
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white54),
                    maxLines: 1,
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
