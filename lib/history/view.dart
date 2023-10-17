import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'logic.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  final logic = Get.find<HistoryLogic>();

  @override
  Widget build(BuildContext context) {
    String? history;
    List<dynamic>? jsonData;
    if (GetStorage().hasData("signHistory")) {
      history = GetStorage().read("signHistory");
      print("history == $history");
      jsonData = json.decode(history ?? "");
    }
    return Scaffold(
      backgroundColor: const Color(0xff111111),
      appBar: AppBar(
        backgroundColor: const Color(0xff181818),
        title: const Text(
          "history",
          style: TextStyle(color: Colors.white70),
        ),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white70,
            )),
      ),
      body: history != null ? historyList(jsonData) : empty(),
    );
  }

  Widget historyList(List<dynamic>? list) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              dateTitle(list?[index]['date'] ?? ""),
              const SizedBox(
                height: 8,
              ),
              historyContent(list?[index]['content'] ?? ""),
            ],
          ),
        );
      },
      itemCount: list?.length,
      itemExtent: 80,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
    );
  }

  Widget empty() {
    return const SizedBox.expand(
      child: Center(
        child: Text(
          "没有签到记录",
          style: TextStyle(fontSize: 18, color: Colors.white60),
        ),
      ),
    );
  }

  Widget dateTitle(String date) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
      child: Text(
        date,
        style: const TextStyle(color: Colors.white38, fontSize: 13),
      ),
    );
  }

  Widget historyContent(String content) {
    return Text(
      content,
      style: const TextStyle(color: Colors.white70, fontSize: 15),
    );
  }
}
