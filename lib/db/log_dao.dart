//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:drift/drift.dart';
import 'package:speeder_sign_flutter/db/entity/log_entity.dart';
import 'package:speeder_sign_flutter/db/speeder_datebase.dart';

part 'log_dao.g.dart';

///@author  fansan
///@version 2023/10/27
///@des     log_dao

@DriftAccessor(tables: [LogEntity])
class LogDAO extends DatabaseAccessor<SpeederDatebase> with _$LogDAOMixin {
  LogDAO(super.attachedDatabase);

  Future<List<LogEntityData>> get getAll =>
      (select(logEntity)..orderBy([(t) => OrderingTerm(expression: t.createTime, mode: OrderingMode.desc)])).get();

  void saveOne(Insertable<LogEntityData> entity) {
    into(logEntity).insert(entity);
  }
}
