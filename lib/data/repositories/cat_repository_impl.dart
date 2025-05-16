// data/repositories/cat_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:pawpartner/core/errors/failure.dart';
import 'package:pawpartner/data/models/cat_dto.dart';
import 'package:pawpartner/domain/repositories/cat_repository.dart';
import 'package:pawpartner/data/api/cat_api.dart';

class CatRepositoryImpl implements CatRepository {
  final CatApi _api;

  CatRepositoryImpl(this._api);

  @override
  Future<Either<Failure, Cat>> fetchRandomCat() async {
    try {
      final cat = await _api.fetchRandomCat();
      return Right(cat);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on NetworkException catch (e) {
      return Left(NetworkFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getAllBreeds() {
    throw UnimplementedError();
  }
}
