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
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(Get.context!).primaryColor,
          title: Text(
            "History",
            style: Theme.of(Get.context!).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
          ),
          bottom: TabBar(
            dividerColor: Theme.of(context).scaffoldBackgroundColor,
            indicatorColor: Theme.of(context).primaryColorDark,
            labelColor: Theme.of(context).textTheme.bodyMedium?.color,
            unselectedLabelColor: Theme.of(context).textTheme.titleMedium?.color,
            labelStyle: Theme.of(context).textTheme.bodyMedium,
            unselectedLabelStyle: Theme.of(context).textTheme.bodyMedium,
            tabs: const [
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
