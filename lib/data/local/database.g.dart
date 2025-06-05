// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CachedCatsTable extends CachedCats
    with TableInfo<$CachedCatsTable, CachedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedNameMeta = const VerificationMeta(
    'breedName',
  );
  @override
  late final GeneratedColumn<String> breedName = GeneratedColumn<String>(
    'breed_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastFetchedMeta = const VerificationMeta(
    'lastFetched',
  );
  @override
  late final GeneratedColumn<DateTime> lastFetched = GeneratedColumn<DateTime>(
    'last_fetched',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    url,
    breedName,
    description,
    lastFetched,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedCat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('breed_name')) {
      context.handle(
        _breedNameMeta,
        breedName.isAcceptableOrUnknown(data['breed_name']!, _breedNameMeta),
      );
    } else if (isInserting) {
      context.missing(_breedNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('last_fetched')) {
      context.handle(
        _lastFetchedMeta,
        lastFetched.isAcceptableOrUnknown(
          data['last_fetched']!,
          _lastFetchedMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_lastFetchedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedCat(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      url:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}url'],
          )!,
      breedName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}breed_name'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      lastFetched:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}last_fetched'],
          )!,
    );
  }

  @override
  $CachedCatsTable createAlias(String alias) {
    return $CachedCatsTable(attachedDatabase, alias);
  }
}

class CachedCat extends DataClass implements Insertable<CachedCat> {
  final String id;
  final String url;
  final String breedName;
  final String description;
  final DateTime lastFetched;
  const CachedCat({
    required this.id,
    required this.url,
    required this.breedName,
    required this.description,
    required this.lastFetched,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['url'] = Variable<String>(url);
    map['breed_name'] = Variable<String>(breedName);
    map['description'] = Variable<String>(description);
    map['last_fetched'] = Variable<DateTime>(lastFetched);
    return map;
  }

  CachedCatsCompanion toCompanion(bool nullToAbsent) {
    return CachedCatsCompanion(
      id: Value(id),
      url: Value(url),
      breedName: Value(breedName),
      description: Value(description),
      lastFetched: Value(lastFetched),
    );
  }

  factory CachedCat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedCat(
      id: serializer.fromJson<String>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      breedName: serializer.fromJson<String>(json['breedName']),
      description: serializer.fromJson<String>(json['description']),
      lastFetched: serializer.fromJson<DateTime>(json['lastFetched']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'url': serializer.toJson<String>(url),
      'breedName': serializer.toJson<String>(breedName),
      'description': serializer.toJson<String>(description),
      'lastFetched': serializer.toJson<DateTime>(lastFetched),
    };
  }

  CachedCat copyWith({
    String? id,
    String? url,
    String? breedName,
    String? description,
    DateTime? lastFetched,
  }) => CachedCat(
    id: id ?? this.id,
    url: url ?? this.url,
    breedName: breedName ?? this.breedName,
    description: description ?? this.description,
    lastFetched: lastFetched ?? this.lastFetched,
  );
  CachedCat copyWithCompanion(CachedCatsCompanion data) {
    return CachedCat(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      breedName: data.breedName.present ? data.breedName.value : this.breedName,
      description:
          data.description.present ? data.description.value : this.description,
      lastFetched:
          data.lastFetched.present ? data.lastFetched.value : this.lastFetched,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedCat(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('lastFetched: $lastFetched')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, breedName, description, lastFetched);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedCat &&
          other.id == this.id &&
          other.url == this.url &&
          other.breedName == this.breedName &&
          other.description == this.description &&
          other.lastFetched == this.lastFetched);
}

class CachedCatsCompanion extends UpdateCompanion<CachedCat> {
  final Value<String> id;
  final Value<String> url;
  final Value<String> breedName;
  final Value<String> description;
  final Value<DateTime> lastFetched;
  final Value<int> rowid;
  const CachedCatsCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.breedName = const Value.absent(),
    this.description = const Value.absent(),
    this.lastFetched = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedCatsCompanion.insert({
    required String id,
    required String url,
    required String breedName,
    required String description,
    required DateTime lastFetched,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       url = Value(url),
       breedName = Value(breedName),
       description = Value(description),
       lastFetched = Value(lastFetched);
  static Insertable<CachedCat> custom({
    Expression<String>? id,
    Expression<String>? url,
    Expression<String>? breedName,
    Expression<String>? description,
    Expression<DateTime>? lastFetched,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (breedName != null) 'breed_name': breedName,
      if (description != null) 'description': description,
      if (lastFetched != null) 'last_fetched': lastFetched,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedCatsCompanion copyWith({
    Value<String>? id,
    Value<String>? url,
    Value<String>? breedName,
    Value<String>? description,
    Value<DateTime>? lastFetched,
    Value<int>? rowid,
  }) {
    return CachedCatsCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      breedName: breedName ?? this.breedName,
      description: description ?? this.description,
      lastFetched: lastFetched ?? this.lastFetched,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (breedName.present) {
      map['breed_name'] = Variable<String>(breedName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (lastFetched.present) {
      map['last_fetched'] = Variable<DateTime>(lastFetched.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedCatsCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('lastFetched: $lastFetched, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $LikedCatsTable extends LikedCats
    with TableInfo<$LikedCatsTable, LikedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LikedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _breedNameMeta = const VerificationMeta(
    'breedName',
  );
  @override
  late final GeneratedColumn<String> breedName = GeneratedColumn<String>(
    'breed_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _likedDateMeta = const VerificationMeta(
    'likedDate',
  );
  @override
  late final GeneratedColumn<DateTime> likedDate = GeneratedColumn<DateTime>(
    'liked_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    url,
    breedName,
    description,
    likedDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'liked_cats';
  @override
  VerificationContext validateIntegrity(
    Insertable<LikedCat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('breed_name')) {
      context.handle(
        _breedNameMeta,
        breedName.isAcceptableOrUnknown(data['breed_name']!, _breedNameMeta),
      );
    } else if (isInserting) {
      context.missing(_breedNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('liked_date')) {
      context.handle(
        _likedDateMeta,
        likedDate.isAcceptableOrUnknown(data['liked_date']!, _likedDateMeta),
      );
    } else if (isInserting) {
      context.missing(_likedDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  LikedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LikedCat(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      url:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}url'],
          )!,
      breedName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}breed_name'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
      likedDate:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}liked_date'],
          )!,
    );
  }

  @override
  $LikedCatsTable createAlias(String alias) {
    return $LikedCatsTable(attachedDatabase, alias);
  }
}

class LikedCat extends DataClass implements Insertable<LikedCat> {
  final String id;
  final String url;
  final String breedName;
  final String description;
  final DateTime likedDate;
  const LikedCat({
    required this.id,
    required this.url,
    required this.breedName,
    required this.description,
    required this.likedDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['url'] = Variable<String>(url);
    map['breed_name'] = Variable<String>(breedName);
    map['description'] = Variable<String>(description);
    map['liked_date'] = Variable<DateTime>(likedDate);
    return map;
  }

  LikedCatsCompanion toCompanion(bool nullToAbsent) {
    return LikedCatsCompanion(
      id: Value(id),
      url: Value(url),
      breedName: Value(breedName),
      description: Value(description),
      likedDate: Value(likedDate),
    );
  }

  factory LikedCat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LikedCat(
      id: serializer.fromJson<String>(json['id']),
      url: serializer.fromJson<String>(json['url']),
      breedName: serializer.fromJson<String>(json['breedName']),
      description: serializer.fromJson<String>(json['description']),
      likedDate: serializer.fromJson<DateTime>(json['likedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'url': serializer.toJson<String>(url),
      'breedName': serializer.toJson<String>(breedName),
      'description': serializer.toJson<String>(description),
      'likedDate': serializer.toJson<DateTime>(likedDate),
    };
  }

  LikedCat copyWith({
    String? id,
    String? url,
    String? breedName,
    String? description,
    DateTime? likedDate,
  }) => LikedCat(
    id: id ?? this.id,
    url: url ?? this.url,
    breedName: breedName ?? this.breedName,
    description: description ?? this.description,
    likedDate: likedDate ?? this.likedDate,
  );
  LikedCat copyWithCompanion(LikedCatsCompanion data) {
    return LikedCat(
      id: data.id.present ? data.id.value : this.id,
      url: data.url.present ? data.url.value : this.url,
      breedName: data.breedName.present ? data.breedName.value : this.breedName,
      description:
          data.description.present ? data.description.value : this.description,
      likedDate: data.likedDate.present ? data.likedDate.value : this.likedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LikedCat(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('likedDate: $likedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, url, breedName, description, likedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LikedCat &&
          other.id == this.id &&
          other.url == this.url &&
          other.breedName == this.breedName &&
          other.description == this.description &&
          other.likedDate == this.likedDate);
}

class LikedCatsCompanion extends UpdateCompanion<LikedCat> {
  final Value<String> id;
  final Value<String> url;
  final Value<String> breedName;
  final Value<String> description;
  final Value<DateTime> likedDate;
  final Value<int> rowid;
  const LikedCatsCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.breedName = const Value.absent(),
    this.description = const Value.absent(),
    this.likedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LikedCatsCompanion.insert({
    required String id,
    required String url,
    required String breedName,
    required String description,
    required DateTime likedDate,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       url = Value(url),
       breedName = Value(breedName),
       description = Value(description),
       likedDate = Value(likedDate);
  static Insertable<LikedCat> custom({
    Expression<String>? id,
    Expression<String>? url,
    Expression<String>? breedName,
    Expression<String>? description,
    Expression<DateTime>? likedDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (breedName != null) 'breed_name': breedName,
      if (description != null) 'description': description,
      if (likedDate != null) 'liked_date': likedDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LikedCatsCompanion copyWith({
    Value<String>? id,
    Value<String>? url,
    Value<String>? breedName,
    Value<String>? description,
    Value<DateTime>? likedDate,
    Value<int>? rowid,
  }) {
    return LikedCatsCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      breedName: breedName ?? this.breedName,
      description: description ?? this.description,
      likedDate: likedDate ?? this.likedDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (breedName.present) {
      map['breed_name'] = Variable<String>(breedName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (likedDate.present) {
      map['liked_date'] = Variable<DateTime>(likedDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LikedCatsCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('likedDate: $likedDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CachedCatsTable cachedCats = $CachedCatsTable(this);
  late final $LikedCatsTable likedCats = $LikedCatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cachedCats, likedCats];
}

typedef $$CachedCatsTableCreateCompanionBuilder =
    CachedCatsCompanion Function({
      required String id,
      required String url,
      required String breedName,
      required String description,
      required DateTime lastFetched,
      Value<int> rowid,
    });
typedef $$CachedCatsTableUpdateCompanionBuilder =
    CachedCatsCompanion Function({
      Value<String> id,
      Value<String> url,
      Value<String> breedName,
      Value<String> description,
      Value<DateTime> lastFetched,
      Value<int> rowid,
    });

class $$CachedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedCatsTable> {
  $$CachedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breedName => $composableBuilder(
    column: $table.breedName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastFetched => $composableBuilder(
    column: $table.lastFetched,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedCatsTable> {
  $$CachedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breedName => $composableBuilder(
    column: $table.breedName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastFetched => $composableBuilder(
    column: $table.lastFetched,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedCatsTable> {
  $$CachedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get breedName =>
      $composableBuilder(column: $table.breedName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get lastFetched => $composableBuilder(
    column: $table.lastFetched,
    builder: (column) => column,
  );
}

class $$CachedCatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedCatsTable,
          CachedCat,
          $$CachedCatsTableFilterComposer,
          $$CachedCatsTableOrderingComposer,
          $$CachedCatsTableAnnotationComposer,
          $$CachedCatsTableCreateCompanionBuilder,
          $$CachedCatsTableUpdateCompanionBuilder,
          (
            CachedCat,
            BaseReferences<_$AppDatabase, $CachedCatsTable, CachedCat>,
          ),
          CachedCat,
          PrefetchHooks Function()
        > {
  $$CachedCatsTableTableManager(_$AppDatabase db, $CachedCatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$CachedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CachedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$CachedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> breedName = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> lastFetched = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CachedCatsCompanion(
                id: id,
                url: url,
                breedName: breedName,
                description: description,
                lastFetched: lastFetched,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String url,
                required String breedName,
                required String description,
                required DateTime lastFetched,
                Value<int> rowid = const Value.absent(),
              }) => CachedCatsCompanion.insert(
                id: id,
                url: url,
                breedName: breedName,
                description: description,
                lastFetched: lastFetched,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedCatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedCatsTable,
      CachedCat,
      $$CachedCatsTableFilterComposer,
      $$CachedCatsTableOrderingComposer,
      $$CachedCatsTableAnnotationComposer,
      $$CachedCatsTableCreateCompanionBuilder,
      $$CachedCatsTableUpdateCompanionBuilder,
      (CachedCat, BaseReferences<_$AppDatabase, $CachedCatsTable, CachedCat>),
      CachedCat,
      PrefetchHooks Function()
    >;
typedef $$LikedCatsTableCreateCompanionBuilder =
    LikedCatsCompanion Function({
      required String id,
      required String url,
      required String breedName,
      required String description,
      required DateTime likedDate,
      Value<int> rowid,
    });
typedef $$LikedCatsTableUpdateCompanionBuilder =
    LikedCatsCompanion Function({
      Value<String> id,
      Value<String> url,
      Value<String> breedName,
      Value<String> description,
      Value<DateTime> likedDate,
      Value<int> rowid,
    });

class $$LikedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breedName => $composableBuilder(
    column: $table.breedName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get likedDate => $composableBuilder(
    column: $table.likedDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$LikedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breedName => $composableBuilder(
    column: $table.breedName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get likedDate => $composableBuilder(
    column: $table.likedDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LikedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LikedCatsTable> {
  $$LikedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get breedName =>
      $composableBuilder(column: $table.breedName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get likedDate =>
      $composableBuilder(column: $table.likedDate, builder: (column) => column);
}

class $$LikedCatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LikedCatsTable,
          LikedCat,
          $$LikedCatsTableFilterComposer,
          $$LikedCatsTableOrderingComposer,
          $$LikedCatsTableAnnotationComposer,
          $$LikedCatsTableCreateCompanionBuilder,
          $$LikedCatsTableUpdateCompanionBuilder,
          (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
          LikedCat,
          PrefetchHooks Function()
        > {
  $$LikedCatsTableTableManager(_$AppDatabase db, $LikedCatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$LikedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$LikedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$LikedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> url = const Value.absent(),
                Value<String> breedName = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<DateTime> likedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion(
                id: id,
                url: url,
                breedName: breedName,
                description: description,
                likedDate: likedDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String url,
                required String breedName,
                required String description,
                required DateTime likedDate,
                Value<int> rowid = const Value.absent(),
              }) => LikedCatsCompanion.insert(
                id: id,
                url: url,
                breedName: breedName,
                description: description,
                likedDate: likedDate,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$LikedCatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LikedCatsTable,
      LikedCat,
      $$LikedCatsTableFilterComposer,
      $$LikedCatsTableOrderingComposer,
      $$LikedCatsTableAnnotationComposer,
      $$LikedCatsTableCreateCompanionBuilder,
      $$LikedCatsTableUpdateCompanionBuilder,
      (LikedCat, BaseReferences<_$AppDatabase, $LikedCatsTable, LikedCat>),
      LikedCat,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CachedCatsTableTableManager get cachedCats =>
      $$CachedCatsTableTableManager(_db, _db.cachedCats);
  $$LikedCatsTableTableManager get likedCats =>
      $$LikedCatsTableTableManager(_db, _db.likedCats);
}
