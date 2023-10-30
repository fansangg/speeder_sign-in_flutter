import 'package:get/get.dart';
import 'package:speeder_sign_flutter/db/db_helper.dart';
import 'package:speeder_sign_flutter/db/speeder_datebase.dart';

import 'state.dart';

class InfoHistoryPgaeController extends GetxController {
  final InfoHistoryPgaeState state = InfoHistoryPgaeState();

  var historyList = <SpeederEntityData>[].obs;

  void _getHistory() async {
    historyList.value = await DBHelper.infoDao.getAll();
  }

  @override
  void onReady() {
    super.onReady();
    _getHistory();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
