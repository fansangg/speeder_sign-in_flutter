//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:drift/drift.dart';

///@author  fansan
///@version 2023/10/27
///@des     log_entity 

class LogEntity extends Table{
  TextColumn get content => text().withDefault(Constant(""))();
  DateTimeColumn get createTime  => dateTime().clientDefault(() => DateTime.now())();
  IntColumn get id => integer().autoIncrement()();
}


 

