// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class CompanyRecord extends DataClass implements Insertable<CompanyRecord> {
  final int id;
  final String name;
  final String detail;
  final CompanyStatus status;
  CompanyRecord(
      {required this.id,
      required this.name,
      required this.detail,
      required this.status});
  factory CompanyRecord.fromData(
      Map<String, dynamic> data, GeneratedDatabase db,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CompanyRecord(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name'])!,
      detail: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}detail'])!,
      status: $CompanyRecordsTable.$converter0.mapToDart(const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}status']))!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['detail'] = Variable<String>(detail);
    {
      final converter = $CompanyRecordsTable.$converter0;
      map['status'] = Variable<int>(converter.mapToSql(status)!);
    }
    return map;
  }

  CompanyRecordsCompanion toCompanion(bool nullToAbsent) {
    return CompanyRecordsCompanion(
      id: Value(id),
      name: Value(name),
      detail: Value(detail),
      status: Value(status),
    );
  }

  factory CompanyRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return CompanyRecord(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      detail: serializer.fromJson<String>(json['detail']),
      status: serializer.fromJson<CompanyStatus>(json['status']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'detail': serializer.toJson<String>(detail),
      'status': serializer.toJson<CompanyStatus>(status),
    };
  }

  CompanyRecord copyWith(
          {int? id, String? name, String? detail, CompanyStatus? status}) =>
      CompanyRecord(
        id: id ?? this.id,
        name: name ?? this.name,
        detail: detail ?? this.detail,
        status: status ?? this.status,
      );
  @override
  String toString() {
    return (StringBuffer('CompanyRecord(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => $mrjf($mrjc(id.hashCode,
      $mrjc(name.hashCode, $mrjc(detail.hashCode, status.hashCode))));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyRecord &&
          other.id == this.id &&
          other.name == this.name &&
          other.detail == this.detail &&
          other.status == this.status);
}

class CompanyRecordsCompanion extends UpdateCompanion<CompanyRecord> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> detail;
  final Value<CompanyStatus> status;
  const CompanyRecordsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.detail = const Value.absent(),
    this.status = const Value.absent(),
  });
  CompanyRecordsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String detail,
    required CompanyStatus status,
  })  : name = Value(name),
        detail = Value(detail),
        status = Value(status);
  static Insertable<CompanyRecord> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? detail,
    Expression<CompanyStatus>? status,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (detail != null) 'detail': detail,
      if (status != null) 'status': status,
    });
  }

  CompanyRecordsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? detail,
      Value<CompanyStatus>? status}) {
    return CompanyRecordsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      detail: detail ?? this.detail,
      status: status ?? this.status,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (detail.present) {
      map['detail'] = Variable<String>(detail.value);
    }
    if (status.present) {
      final converter = $CompanyRecordsTable.$converter0;
      map['status'] = Variable<int>(converter.mapToSql(status.value)!);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyRecordsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('detail: $detail, ')
          ..write('status: $status')
          ..write(')'))
        .toString();
  }
}

class $CompanyRecordsTable extends CompanyRecords
    with TableInfo<$CompanyRecordsTable, CompanyRecord> {
  final GeneratedDatabase _db;
  final String? _alias;
  $CompanyRecordsTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      typeName: 'INTEGER',
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 100),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _detailMeta = const VerificationMeta('detail');
  late final GeneratedColumn<String?> detail = GeneratedColumn<String?>(
      'detail', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 1000),
      typeName: 'TEXT',
      requiredDuringInsert: true);
  final VerificationMeta _statusMeta = const VerificationMeta('status');
  late final GeneratedColumnWithTypeConverter<CompanyStatus, int?> status =
      GeneratedColumn<int?>('status', aliasedName, false,
              typeName: 'INTEGER', requiredDuringInsert: true)
          .withConverter<CompanyStatus>($CompanyRecordsTable.$converter0);
  @override
  List<GeneratedColumn> get $columns => [id, name, detail, status];
  @override
  String get aliasedName => _alias ?? 'company_records';
  @override
  String get actualTableName => 'company_records';
  @override
  VerificationContext validateIntegrity(Insertable<CompanyRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('detail')) {
      context.handle(_detailMeta,
          detail.isAcceptableOrUnknown(data['detail']!, _detailMeta));
    } else if (isInserting) {
      context.missing(_detailMeta);
    }
    context.handle(_statusMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CompanyRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CompanyRecord.fromData(data, _db,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CompanyRecordsTable createAlias(String alias) {
    return $CompanyRecordsTable(_db, alias);
  }

  static TypeConverter<CompanyStatus, int> $converter0 =
      const EnumIndexConverter<CompanyStatus>(CompanyStatus.values);
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CompanyRecordsTable companyRecords = $CompanyRecordsTable(this);
  late final DaoQuery daoQuery = DaoQuery(this as MyDatabase);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [companyRecords];
}
