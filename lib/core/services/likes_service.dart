import 'package:flutter/foundation.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart';

class LikesService extends ChangeNotifier {
  final List<LikedCat> _likedCats = [];

  List<LikedCat> get likedCats => _likedCats;

  void addLikedCat(LikedCat cat) {
    if (!_likedCats.any((c) => c.cat.id == cat.cat.id)) {
      _likedCats.add(cat);
      notifyListeners();
    }
  }

  void removeLikedCat(String id) {
    _likedCats.removeWhere((c) => c.cat.id == id);
    notifyListeners();
  }

  List<String> get availableBreeds =>
      _likedCats.map((c) => c.cat.breedName).toSet().toList();
}
