//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:speeder_sign_flutter/db/info_dao.dart';
import 'package:speeder_sign_flutter/db/log_dao.dart';
import 'package:speeder_sign_flutter/db/speeder_datebase.dart';

///@author  fansan
///@version 2023/10/26
///@des     db_helper

class DBHelper {

  factory DBHelper() => _instance;

  DBHelper._internal();

  static final DBHelper _instance = DBHelper._internal();

  static late SpeederDatebase db;

  static late InfoDao infoDao;
  static late LogDAO logDao;

  static void initDb(){
    db = SpeederDatebase();
    infoDao = InfoDao(db);
    logDao = LogDAO(db);
  }
}
