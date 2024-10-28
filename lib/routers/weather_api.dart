import 'package:http/http.dart' as http;
import 'dart:convert';


class WeatherApi {
  static const String apiKey = '511942cfb8774ca38e2174346242710';
  static const String baseUrl = 'https://api.weatherapi.com/v1/current.json';

  static Future<Map<String, dynamic>> fetchWeather(String city) async {
    final response = await http.get(
      Uri.parse('$baseUrl?key=$apiKey&q=$city'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(utf8.decode(response.bodyBytes));
      return data;
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}

