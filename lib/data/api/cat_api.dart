import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:pawpartner/config/api_config.dart';
import 'package:pawpartner/data/local/database.dart';
import 'package:pawpartner/data/models/cat_dto.dart';

class CatApi {
  final AppDatabase _database;

  CatApi(this._database);
  
  Future<Cat> fetchRandomCat() async {
    try {
      final url = Uri.parse('${ApiConfig.baseUrl}/images/search?has_breeds=true');
      final response = await http
          .get(url, headers: {'x-api-key': ApiConfig.apiKey})
          .timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)[0];
        if (data['breeds'].isEmpty) {
          throw const FormatException('Нет данных о породе');
        }
        final cat = Cat.fromJson(data);
        await _database.cacheCat(cat);
        return cat;
      }
      throw HttpException('Код ошибки: ${response.statusCode}');
    } catch (e) {
      final cachedCats = await _database.getCachedCats();
      if (cachedCats.isNotEmpty) {
        return cachedCats[Random().nextInt(cachedCats.length)];
      }
      rethrow;
    }
  }

  Future<void> sendLike(String catId) async {
    await http.post(
      Uri.parse('${ApiConfig.baseUrl}/likes'),
      headers: {'x-api-key': ApiConfig.apiKey},
      body: jsonEncode({'cat_id': catId}),
    );
  }
}