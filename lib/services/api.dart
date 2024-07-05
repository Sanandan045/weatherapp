import 'dart:convert';

import 'package:weatherapp/constant.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp/model/weather_model.dart';

class WeatherApi {
  final String baseurl = "http://api.weatherapi.com/v1/current.json";

  Future<ApiResponse> getCurrentWeather(String location) async {
    String apiUrl = "$baseurl?key=$apikey&q=$location";

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        return ApiResponse.fromJson(jsonDecode(response.body));
        // print(response.body);
      } else {
        throw Exception("Faild to load weahter data");
      }
    } catch (e) {
      throw Exception("Failed to load Weather");
    }
  }
}
