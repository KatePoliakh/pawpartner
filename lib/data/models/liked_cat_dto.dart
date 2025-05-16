import 'package:pawpartner/data/models/cat_dto.dart';

class LikedCat {
  final Cat cat;
  final DateTime likedDate;

  const LikedCat({required this.cat, required this.likedDate});
}
