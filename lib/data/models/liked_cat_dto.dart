import 'package:pawpartner/data/models/cat_dto.dart';

class LikedCat {
  final Cat cat;
  final DateTime likedDate;

  const LikedCat({required this.cat, required this.likedDate});

  Map<String, dynamic> toJson() => {
    'cat': cat.toJson(),
    'likedDate': likedDate.toIso8601String(),
  };

  factory LikedCat.fromJson(Map<String, dynamic> json) => LikedCat(
    cat: Cat.fromJson(json['cat']),
    likedDate: DateTime.parse(json['likedDate']),
  );

  get breedName => null;
}
