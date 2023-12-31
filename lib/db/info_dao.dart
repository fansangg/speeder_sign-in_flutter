//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'package:drift/drift.dart';
import 'package:speeder_sign_flutter/db/entity/speeder_entity.dart';
import 'package:speeder_sign_flutter/db/speeder_datebase.dart';

part 'info_dao.g.dart';

///@author  fansan
///@version 2023/10/26
///@des     info_dao

@DriftAccessor(tables: [SpeederEntity])
class InfoDao extends DatabaseAccessor<SpeederDatebase> with _$InfoDaoMixin {
  InfoDao(super.attachedDatabase);

  Future<List<SpeederEntityData>> getAll() {
    return (select(speederEntity)
      ..orderBy([(t) => OrderingTerm(expression: t.date,mode: OrderingMode.desc)]))
        .get();
  }

  Future<List<SpeederEntityData>> getOne(String date){
    return (select(speederEntity)..where((tbl) => tbl.date.equals(date))).get();
  }

  void save(Insertable<SpeederEntityData> entity) {
    into(speederEntity).insertOnConflictUpdate(entity);
  }

  /*void updateAll() async {
    var rows = await select(speederEntity).addColumns([speederEntity.date]).get();
    for (var value in rows) {
      var date = value.read(speederEntity.date)??"1970-01-01";
      var list = date.split("-");
      var newDateTime = DateTime(int.parse(list[0]),int.parse(list[1]),int.parse(list[2])).getSimple();
      var newDate = DateTime.parse(newDateTime);
      update(speederEntity)
        ..where((tbl) => tbl.date.equals(date))
        ..write(SpeederEntityCompanion.insert(date: newDateTime,createTime: Value(newDate)));
    }
  }*/
}
