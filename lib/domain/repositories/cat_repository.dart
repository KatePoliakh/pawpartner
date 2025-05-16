import 'package:pawpartner/data/models/cat_dto.dart';
import 'package:pawpartner/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, Cat>> fetchRandomCat();
  
  // Для будущего расширения
  Future<Either<Failure, List<String>>> getAllBreeds();
}