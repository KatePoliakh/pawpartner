import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pawpartner/core/services/likes_service.dart';
import 'package:pawpartner/data/local/database.dart';
import 'package:pawpartner/data/models/cat_dto.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart';
import 'package:pawpartner/data/models/liked_cat_dto.dart' as dto;
import 'package:shared_preferences/src/shared_preferences_legacy.dart';

void main() {
  late LikesService likesService;
  late MockAppDatabase mockDatabase;
  late MockSharedPreferences mockPrefs;

  setUp(() {
    mockDatabase = MockAppDatabase();
    mockPrefs = MockSharedPreferences();
    likesService = LikesService(mockDatabase as AppDatabase, mockPrefs as SharedPreferences);
  });

  test('addLikedCat saves to preferences and database', () async {
    final cat = Cat(id: '1', url: 'url', breedName: 'Breed', description: 'Desc');
    final likedCat = dto.LikedCat(cat: cat, likedDate: DateTime.now());
    
    when(() => mockPrefs.setStringList(any(), any()))
      .thenAnswer((_) async => true);
    
    when(() => mockDatabase.into(any()).insert(any()))
      .thenAnswer((_) async => Future.value());
    
    likesService.addLikedCat(likedCat);
    
    verify(() => mockPrefs.setStringList(any(), any())).called(1);
    verify(() => mockDatabase.into(any()).insert(any())).called(1);
    expect(likesService.likedCats.length, 1);
  });
}

class MockAppDatabase {
  into(any) {}
}

class MockSharedPreferences {
  void setStringList(any, any2) {}
}