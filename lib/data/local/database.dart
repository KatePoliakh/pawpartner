// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:pawpartner/data/models/cat_dto.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart' as dto;

part 'database.g.dart';

@DriftDatabase(tables: [CachedCats, LikedCats])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<void> cacheCat(Cat cat) async {
    await into(cachedCats).insert(
      CachedCatsCompanion.insert(
        id: cat.id,
        url: cat.url,
        breedName: cat.breedName,
        description: cat.description,
        lastFetched: DateTime.now(),
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<List<Cat>> getCachedCats() async {
    final results = await select(cachedCats).get();
    return results
        .map(
          (row) => Cat(
            id: row.id,
            url: row.url,
            breedName: row.breedName,
            description: row.description,
          ),
        )
        .toList();
  }

  Future<int> deleteCachedCat(String id) async {
    return (delete(cachedCats)..where((t) => t.id.equals(id))).go();
  }

  Future<void> clearAllCachedCats() async {
    await delete(cachedCats).go();
  }

  Future<void> clearOldCachedCats({
    Duration ageThreshold = const Duration(days: 7),
  }) async {
    final threshold = DateTime.now().subtract(ageThreshold);
    await (delete(cachedCats)
      ..where((t) => t.lastFetched.isSmallerThanValue(threshold))).go();
  }

  Future<void> addLikedCat(dto.LikedCat cat) async {
    await into(likedCats).insert(
      LikedCatsCompanion.insert(
        id: cat.cat.id,
        url: cat.cat.url,
        breedName: cat.cat.breedName,
        description: cat.cat.description,
        likedDate: cat.likedDate,
      ),
      mode: InsertMode.insertOrReplace,
    );
  }

  Future<List<LikedCat>> getAllLikedCats() async {
    return await select(likedCats).get();
  }

  Future<bool> isCatLiked(String id) async {
    final query = select(likedCats)..where((t) => t.id.equals(id));
    final result = await query.getSingleOrNull();
    return result != null;
  }

  Future<int> removeLikedCat(String id) async {
    return (delete(likedCats)..where((t) => t.id.equals(id))).go();
  }

  Future<void> clearAllLikedCats() async {
    await delete(likedCats).go();
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'pawpartner.sqlite'));
    return NativeDatabase(file);
  });
}

class CachedCats extends Table {
  TextColumn get id => text()();
  TextColumn get url => text()();
  TextColumn get breedName => text()();
  TextColumn get description => text()();
  DateTimeColumn get lastFetched => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class LikedCats extends Table {
  TextColumn get id => text()();
  TextColumn get url => text()();
  TextColumn get breedName => text()();
  TextColumn get description => text()();
  DateTimeColumn get likedDate => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
