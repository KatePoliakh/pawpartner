import 'package:flutter/foundation.dart';
import 'package:pawpartner/data/local/database.dart' show AppDatabase;

import 'package:pawpartner/data/models/cat_dto.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart';
// ignore: implementation_imports
import 'package:shared_preferences/src/shared_preferences_legacy.dart';

class LikesService extends ChangeNotifier {
  final AppDatabase _database;
  List<LikedCat> _likedCats = [];

  LikesService(this._database, SharedPreferences mockPrefs);

  List<LikedCat> get likedCats => _likedCats;

  Future<void> initialize() async {
    await _loadFromDatabase();
  }

  Future<void> _loadFromDatabase() async {
    final dbLikes = await _database.getAllLikedCats();
    _likedCats =
        dbLikes
            .map(
              (likedCatData) => LikedCat(
                cat: Cat(
                  id: likedCatData.id,
                  url: likedCatData.url,
                  breedName: likedCatData.breedName,
                  description: likedCatData.description,
                ),
                likedDate: likedCatData.likedDate,
              ),
            )
            .toList();
    notifyListeners();
  }

  Future<void> addLikedCat(LikedCat cat) async {
    if (!_likedCats.any((c) => c.cat.id == cat.cat.id)) {
      _likedCats.add(cat);
      await _database.addLikedCat(cat);
      notifyListeners();
    }
  }

  Future<void> removeLikedCat(String id) async {
    _likedCats.removeWhere((c) => c.cat.id == id);
    await _database.removeLikedCat(id);
    notifyListeners();
  }

  List<String> get availableBreeds =>
      _likedCats.map((c) => c.cat.breedName).toSet().toList();

  Future<void> clearAll() async {
    _likedCats.clear();
    await _database.clearAllLikedCats();
    notifyListeners();
  }
}
