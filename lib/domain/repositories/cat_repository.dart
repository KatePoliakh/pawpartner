import 'package:pawpartner/data/models/cat_dto.dart';
import 'package:pawpartner/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CatRepository {
  Future<Either<Failure, Cat>> fetchRandomCat();

  Future<Either<Failure, List<String>>> getAllBreeds();
}
