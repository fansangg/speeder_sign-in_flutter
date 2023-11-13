// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'speeder_datebase.dart';

// ignore_for_file: type=lint
class $SpeederEntityTable extends SpeederEntity
    with TableInfo<$SpeederEntityTable, SpeederEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SpeederEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _usageMeta = const VerificationMeta('usage');
  @override
  late final GeneratedColumn<String> usage = GeneratedColumn<String>(
      'usage', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(""));
  static const VerificationMeta _remainMeta = const VerificationMeta('remain');
  @override
  late final GeneratedColumn<String> remain = GeneratedColumn<String>(
      'remain', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(""));
  static const VerificationMeta _awardMeta = const VerificationMeta('award');
  @override
  late final GeneratedColumn<String> award = GeneratedColumn<String>(
      'award', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant("无"));
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [date, usage, remain, award, createTime];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'speeder_entity';
  @override
  VerificationContext validateIntegrity(Insertable<SpeederEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('usage')) {
      context.handle(
          _usageMeta, usage.isAcceptableOrUnknown(data['usage']!, _usageMeta));
    }
    if (data.containsKey('remain')) {
      context.handle(_remainMeta,
          remain.isAcceptableOrUnknown(data['remain']!, _remainMeta));
    }
    if (data.containsKey('award')) {
      context.handle(
          _awardMeta, award.isAcceptableOrUnknown(data['award']!, _awardMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {date};
  @override
  SpeederEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SpeederEntityData(
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date'])!,
      usage: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}usage'])!,
      remain: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remain'])!,
      award: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}award'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time']),
    );
  }

  @override
  $SpeederEntityTable createAlias(String alias) {
    return $SpeederEntityTable(attachedDatabase, alias);
  }
}

class SpeederEntityData extends DataClass
    implements Insertable<SpeederEntityData> {
  final String date;
  final String usage;
  final String remain;
  final String award;
  final DateTime? createTime;
  const SpeederEntityData(
      {required this.date,
      required this.usage,
      required this.remain,
      required this.award,
      this.createTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['date'] = Variable<String>(date);
    map['usage'] = Variable<String>(usage);
    map['remain'] = Variable<String>(remain);
    map['award'] = Variable<String>(award);
    if (!nullToAbsent || createTime != null) {
      map['create_time'] = Variable<DateTime>(createTime);
    }
    return map;
  }

  SpeederEntityCompanion toCompanion(bool nullToAbsent) {
    return SpeederEntityCompanion(
      date: Value(date),
      usage: Value(usage),
      remain: Value(remain),
      award: Value(award),
      createTime: createTime == null && nullToAbsent
          ? const Value.absent()
          : Value(createTime),
    );
  }

  factory SpeederEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SpeederEntityData(
      date: serializer.fromJson<String>(json['date']),
      usage: serializer.fromJson<String>(json['usage']),
      remain: serializer.fromJson<String>(json['remain']),
      award: serializer.fromJson<String>(json['award']),
      createTime: serializer.fromJson<DateTime?>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'date': serializer.toJson<String>(date),
      'usage': serializer.toJson<String>(usage),
      'remain': serializer.toJson<String>(remain),
      'award': serializer.toJson<String>(award),
      'createTime': serializer.toJson<DateTime?>(createTime),
    };
  }

  SpeederEntityData copyWith(
          {String? date,
          String? usage,
          String? remain,
          String? award,
          Value<DateTime?> createTime = const Value.absent()}) =>
      SpeederEntityData(
        date: date ?? this.date,
        usage: usage ?? this.usage,
        remain: remain ?? this.remain,
        award: award ?? this.award,
        createTime: createTime.present ? createTime.value : this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('SpeederEntityData(')
          ..write('date: $date, ')
          ..write('usage: $usage, ')
          ..write('remain: $remain, ')
          ..write('award: $award, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(date, usage, remain, award, createTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SpeederEntityData &&
          other.date == this.date &&
          other.usage == this.usage &&
          other.remain == this.remain &&
          other.award == this.award &&
          other.createTime == this.createTime);
}

class SpeederEntityCompanion extends UpdateCompanion<SpeederEntityData> {
  final Value<String> date;
  final Value<String> usage;
  final Value<String> remain;
  final Value<String> award;
  final Value<DateTime?> createTime;
  final Value<int> rowid;
  const SpeederEntityCompanion({
    this.date = const Value.absent(),
    this.usage = const Value.absent(),
    this.remain = const Value.absent(),
    this.award = const Value.absent(),
    this.createTime = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SpeederEntityCompanion.insert({
    required String date,
    this.usage = const Value.absent(),
    this.remain = const Value.absent(),
    this.award = const Value.absent(),
    this.createTime = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : date = Value(date);
  static Insertable<SpeederEntityData> custom({
    Expression<String>? date,
    Expression<String>? usage,
    Expression<String>? remain,
    Expression<String>? award,
    Expression<DateTime>? createTime,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (date != null) 'date': date,
      if (usage != null) 'usage': usage,
      if (remain != null) 'remain': remain,
      if (award != null) 'award': award,
      if (createTime != null) 'create_time': createTime,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SpeederEntityCompanion copyWith(
      {Value<String>? date,
      Value<String>? usage,
      Value<String>? remain,
      Value<String>? award,
      Value<DateTime?>? createTime,
      Value<int>? rowid}) {
    return SpeederEntityCompanion(
      date: date ?? this.date,
      usage: usage ?? this.usage,
      remain: remain ?? this.remain,
      award: award ?? this.award,
      createTime: createTime ?? this.createTime,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (usage.present) {
      map['usage'] = Variable<String>(usage.value);
    }
    if (remain.present) {
      map['remain'] = Variable<String>(remain.value);
    }
    if (award.present) {
      map['award'] = Variable<String>(award.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SpeederEntityCompanion(')
          ..write('date: $date, ')
          ..write('usage: $usage, ')
          ..write('remain: $remain, ')
          ..write('award: $award, ')
          ..write('createTime: $createTime, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LogEntityTable extends LogEntity
    with TableInfo<$LogEntityTable, LogEntityData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: Constant(""));
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      clientDefault: () => DateTime.now());
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  @override
  List<GeneratedColumn> get $columns => [content, createTime, id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'log_entity';
  @override
  VerificationContext validateIntegrity(Insertable<LogEntityData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LogEntityData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LogEntityData(
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
    );
  }

  @override
  $LogEntityTable createAlias(String alias) {
    return $LogEntityTable(attachedDatabase, alias);
  }
}

class LogEntityData extends DataClass implements Insertable<LogEntityData> {
  final String content;
  final DateTime createTime;
  final int id;
  const LogEntityData(
      {required this.content, required this.createTime, required this.id});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['content'] = Variable<String>(content);
    map['create_time'] = Variable<DateTime>(createTime);
    map['id'] = Variable<int>(id);
    return map;
  }

  LogEntityCompanion toCompanion(bool nullToAbsent) {
    return LogEntityCompanion(
      content: Value(content),
      createTime: Value(createTime),
      id: Value(id),
    );
  }

  factory LogEntityData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LogEntityData(
      content: serializer.fromJson<String>(json['content']),
      createTime: serializer.fromJson<DateTime>(json['createTime']),
      id: serializer.fromJson<int>(json['id']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'content': serializer.toJson<String>(content),
      'createTime': serializer.toJson<DateTime>(createTime),
      'id': serializer.toJson<int>(id),
    };
  }

  LogEntityData copyWith({String? content, DateTime? createTime, int? id}) =>
      LogEntityData(
        content: content ?? this.content,
        createTime: createTime ?? this.createTime,
        id: id ?? this.id,
      );
  @override
  String toString() {
    return (StringBuffer('LogEntityData(')
          ..write('content: $content, ')
          ..write('createTime: $createTime, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(content, createTime, id);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LogEntityData &&
          other.content == this.content &&
          other.createTime == this.createTime &&
          other.id == this.id);
}

class LogEntityCompanion extends UpdateCompanion<LogEntityData> {
  final Value<String> content;
  final Value<DateTime> createTime;
  final Value<int> id;
  const LogEntityCompanion({
    this.content = const Value.absent(),
    this.createTime = const Value.absent(),
    this.id = const Value.absent(),
  });
  LogEntityCompanion.insert({
    this.content = const Value.absent(),
    this.createTime = const Value.absent(),
    this.id = const Value.absent(),
  });
  static Insertable<LogEntityData> custom({
    Expression<String>? content,
    Expression<DateTime>? createTime,
    Expression<int>? id,
  }) {
    return RawValuesInsertable({
      if (content != null) 'content': content,
      if (createTime != null) 'create_time': createTime,
      if (id != null) 'id': id,
    });
  }

  LogEntityCompanion copyWith(
      {Value<String>? content, Value<DateTime>? createTime, Value<int>? id}) {
    return LogEntityCompanion(
      content: content ?? this.content,
      createTime: createTime ?? this.createTime,
      id: id ?? this.id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogEntityCompanion(')
          ..write('content: $content, ')
          ..write('createTime: $createTime, ')
          ..write('id: $id')
          ..write(')'))
        .toString();
  }
}

abstract class _$SpeederDatebase extends GeneratedDatabase {
  _$SpeederDatebase(QueryExecutor e) : super(e);
  late final $SpeederEntityTable speederEntity = $SpeederEntityTable(this);
  late final $LogEntityTable logEntity = $LogEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [speederEntity, logEntity];
}
