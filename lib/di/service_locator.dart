// di/service_locator.dart
import 'package:get_it/get_it.dart';
import 'package:pawpartner/data/api/cat_api.dart';
import 'package:pawpartner/data/repositories/cat_repository_impl.dart';
import 'package:pawpartner/domain/repositories/cat_repository.dart';
import 'package:pawpartner/core/services/likes_service.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Services
  getIt.registerLazySingleton<LikesService>(() => LikesService());
  
  // API
  getIt.registerLazySingleton<CatApi>(() => CatApi());
  
  // Repositories
  getIt.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(getIt<CatApi>()),
  );
}