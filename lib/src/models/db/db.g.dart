// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Category extends DataClass implements Insertable<Category> {
  final int id;
  final String category;
  final String memo;
  Category({@required this.id, @required this.category, @required this.memo});
  factory Category.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final intType = db.typeSystem.forDartType<int>();
    final stringType = db.typeSystem.forDartType<String>();
    return Category(
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      category: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}category']),
      memo: stringType.mapFromDatabaseResponse(data['${effectivePrefix}memo']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (!nullToAbsent || id != null) {
      map['id'] = Variable<int>(id);
    }
    if (!nullToAbsent || category != null) {
      map['category'] = Variable<String>(category);
    }
    if (!nullToAbsent || memo != null) {
      map['memo'] = Variable<String>(memo);
    }
    return map;
  }

  factory Category.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Category(
      id: serializer.fromJson<int>(json['id']),
      category: serializer.fromJson<String>(json['category']),
      memo: serializer.fromJson<String>(json['memo']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'category': serializer.toJson<String>(category),
      'memo': serializer.toJson<String>(memo),
    };
  }

  Category copyWith({int id, String category, String memo}) => Category(
        id: id ?? this.id,
        category: category ?? this.category,
        memo: memo ?? this.memo,
      );
  @override
  String toString() {
    return (StringBuffer('Category(')
          ..write('id: $id, ')
          ..write('category: $category, ')
          ..write('memo: $memo')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(id.hashCode, $mrjc(category.hashCode, memo.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Category &&
          other.id == this.id &&
          other.category == this.category &&
          other.memo == this.memo);
}

class CategoriesCompanion extends UpdateCompanion<Category> {
  final Value<int> id;
  final Value<String> category;
  final Value<String> memo;
  const CategoriesCompanion({
    this.id = const Value.absent(),
    this.category = const Value.absent(),
    this.memo = const Value.absent(),
  });
  CategoriesCompanion.insert({
    this.id = const Value.absent(),
    @required String category,
    @required String memo,
  })  : category = Value(category),
        memo = Value(memo);
  static Insertable<Category> custom({
    Expression<int> id,
    Expression<String> category,
    Expression<String> memo,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (category != null) 'category': category,
      if (memo != null) 'memo': memo,
    });
  }

  CategoriesCompanion copyWith(
      {Value<int> id, Value<String> category, Value<String> memo}) {
    return CategoriesCompanion(
      id: id ?? this.id,
      category: category ?? this.category,
      memo: memo ?? this.memo,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (memo.present) {
      map['memo'] = Variable<String>(memo.value);
    }
    return map;
  }
}

class $CategoriesTable extends Categories
    with TableInfo<$CategoriesTable, Category> {
  final GeneratedDatabase _db;
  final String _alias;
  $CategoriesTable(this._db, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _categoryMeta = const VerificationMeta('category');
  GeneratedTextColumn _category;
  @override
  GeneratedTextColumn get category => _category ??= _constructCategory();
  GeneratedTextColumn _constructCategory() {
    return GeneratedTextColumn(
      'category',
      $tableName,
      false,
    );
  }

  final VerificationMeta _memoMeta = const VerificationMeta('memo');
  GeneratedTextColumn _memo;
  @override
  GeneratedTextColumn get memo => _memo ??= _constructMemo();
  GeneratedTextColumn _constructMemo() {
    return GeneratedTextColumn('memo', $tableName, false,
        minTextLength: 1, maxTextLength: 38);
  }

  @override
  List<GeneratedColumn> get $columns => [id, category, memo];
  @override
  $CategoriesTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'categories';
  @override
  final String actualTableName = 'categories';
  @override
  VerificationContext validateIntegrity(Insertable<Category> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id'], _idMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category'], _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('memo')) {
      context.handle(
          _memoMeta, memo.isAcceptableOrUnknown(data['memo'], _memoMeta));
    } else if (isInserting) {
      context.missing(_memoMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Category map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Category.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  $CategoriesTable createAlias(String alias) {
    return $CategoriesTable(_db, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $CategoriesTable _categories;
  $CategoriesTable get categories => _categories ??= $CategoriesTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [categories];
}
