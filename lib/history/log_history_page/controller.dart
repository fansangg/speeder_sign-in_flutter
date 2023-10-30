import 'package:get/get.dart';
import 'package:speeder_sign_flutter/db/db_helper.dart';

import '../../db/speeder_datebase.dart';
import 'state.dart';

class LogHistoryPageController extends GetxController {
  final LogHistoryPageState state = LogHistoryPageState();
  List<LogEntityData> logEntityData = <LogEntityData>[].obs;

  void _getLogs() async {
    logEntityData =  await DBHelper.logDao.getAll;
  }

  @override
  void onReady() {
    super.onReady();
    _getLogs();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
