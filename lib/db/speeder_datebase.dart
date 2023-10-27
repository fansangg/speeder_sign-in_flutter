//ignore_for_file: prefer_const_constructors, depend_on_referenced_packages,avoid_print

import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:speeder_sign_flutter/db/entity/log_entity.dart';
import 'package:speeder_sign_flutter/db/entity/speeder_entity.dart';
import 'package:drift/native.dart';

part 'speeder_datebase.g.dart';

///@author  fansan
///@version 2023/10/26
///@des     speeder_datebase

@DriftDatabase(tables: [SpeederEntity,LogEntity])
class SpeederDatebase extends _$SpeederDatebase {
  SpeederDatebase():super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File(join(dir.path,"speeder.db"));
    return NativeDatabase(file);
  });
}