import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pawpartner/core/services/likes_service.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart' as dto;

class LikedCatsCubit extends Cubit<List<dto.LikedCat>> {
  final LikesService _likesService;
  String? selectedBreed;

  LikedCatsCubit(this._likesService) : super(_likesService.likedCats) {
    _likesService.addListener(_onLikesChanged);
  }

  void _onLikesChanged() => emit(_filterCats());

  List<dto.LikedCat> _filterCats() {
    return _likesService.likedCats.where((cat) {
      if (selectedBreed == null) return true;
      return cat.breedName == selectedBreed;
    }).toList();
  }

  void filterByBreed(String? breed) {
    selectedBreed = breed;
    emit(_filterCats());
  }

  @override
  Future<void> close() {
    _likesService.removeListener(_onLikesChanged);
    return super.close();
  }
}
