import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speeder_sign_flutter/history/info_history_pgae/view.dart';
import 'package:speeder_sign_flutter/history/log_history_page/view.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xff111111),
        appBar: AppBar(
          backgroundColor: const Color(0xff181818),
          title: const Text(
            "History",
            style: TextStyle(color: Colors.white70),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "info",
              ),
              Tab(
                text: "log",
              ),
            ],
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
        body: const TabBarView(
          children: [
            InfoHistoryPgae(),
            LogHistoryPage(),
          ],
        ),
      ),
    );
  }
}
