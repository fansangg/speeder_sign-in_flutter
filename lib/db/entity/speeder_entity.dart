//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:drift/drift.dart';

///@author  fansan
///@version 2023/10/26
///@des     speeder_entity 

class SpeederEntity extends Table{
  TextColumn get date => text()();
  TextColumn get usage => text().withDefault(Constant(""))();
  TextColumn get remain => text().withDefault(Constant(""))();
  TextColumn get award => text().withDefault(Constant("无"))();
  DateTimeColumn get createTime => dateTime().nullable()();
  @override
  Set<Column> get primaryKey => {date};
}


 

