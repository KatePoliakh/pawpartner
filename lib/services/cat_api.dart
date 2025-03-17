import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pawpartner/config/config.dart';
import '../models/cat_model.dart';

class CatApi {
  Future<Cat> fetchRandomCat() async {
    final response = await http.get(
      Uri.parse('${ApiConfig.baseUrl}/images/search?has_breeds=true'),
      headers: {'x-api-key': ApiConfig.apiKey},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body)[0];
      return Cat.fromJson(data);
    } else {
      throw Exception('Failed to load cat');
    }
  }
}
