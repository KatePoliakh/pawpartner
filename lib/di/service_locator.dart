import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:pawpartner/core/network/network_info.dart';
import 'package:pawpartner/core/sync/sync_service.dart'; // Импортируем SyncService
import 'package:pawpartner/data/api/cat_api.dart';
import 'package:pawpartner/data/local/database.dart';
import 'package:pawpartner/data/repositories/cat_repository_impl.dart';
import 'package:pawpartner/domain/repositories/cat_repository.dart';
import 'package:pawpartner/core/services/likes_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  final database = AppDatabase();
  final prefs = await SharedPreferences.getInstance();
  final connectivity = Connectivity();
  final networkInfo = NetworkInfo(connectivity);
  
  getIt.registerSingleton<AppDatabase>(database);
  getIt.registerSingleton<SharedPreferences>(prefs);
  getIt.registerSingleton<Connectivity>(connectivity); 
  getIt.registerSingleton<NetworkInfo>(networkInfo);
  
  getIt.registerLazySingleton<LikesService>(() => LikesService(database, prefs));
  getIt.registerLazySingleton<CatApi>(() => CatApi(database));
  
  getIt.registerLazySingleton<CatRepository>(
    () => CatRepositoryImpl(getIt<CatApi>()),
  );
  
  getIt.registerLazySingleton<SyncService>(() => SyncService(
    getIt<AppDatabase>(),
    getIt<CatApi>(),
    getIt<Connectivity>(), 
  ));
}