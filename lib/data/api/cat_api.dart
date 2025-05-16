import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:pawpartner/config/api_config.dart';
import 'package:pawpartner/data/models/cat_dto.dart';

class CatApi {
  Future<Cat> fetchRandomCat() async {
    final url = Uri.parse('${ApiConfig.baseUrl}/images/search?has_breeds=true');
    
    try {
      final response = await http.get(
        url,
        headers: {'x-api-key': ApiConfig.apiKey},
      ).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body)[0];
        if (data['breeds'].isEmpty) throw const FormatException('Нет данных о породе');
        return Cat.fromJson(data);
      }
      throw HttpException('Код ошибки: ${response.statusCode}');
    } on SocketException {
      throw const SocketException('Нет подключения к интернету');
    } on TimeoutException {
      throw TimeoutException('Превышено время ожидания');
    }
  }
}