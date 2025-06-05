import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pawpartner/data/api/cat_api.dart';
import 'package:pawpartner/data/local/database.dart';

class SyncService {
  final AppDatabase _database;
  final CatApi _api;
  final Connectivity _connectivity;

  SyncService(this._database, this._api, this._connectivity) {
    _initSync();
  }

  void _initSync() {
    _connectivity.onConnectivityChanged.listen((result) async {
      if (result != ConnectivityResult.none) {
        await _syncLikes();
        await _refreshCache();
        await _database.clearAllCachedCats();
      }
    });
  }

  Future<void> _syncLikes() async {
    final localLikes = await _database.getAllLikedCats();

    for (final likedCat in localLikes) {
      try {
        await _api.sendLike(likedCat.id);
      } catch (e) {}
    }
  }

  Future<void> _refreshCache() async {
    try {
      for (int i = 0; i < 5; i++) {
        await _api.fetchRandomCat();
      }
    } catch (e) {}
  }
}
