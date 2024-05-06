import 'package:dio/dio.dart';
import 'package:today_weather/models/model_weather.dart';

class ApiCurrent {
  static Future<WeatherModel> callApiCurrent(String address) async {
    if (address.isEmpty) {
      address = 'Hanoi';
    }
    try {
      final dio = Dio();
      final res = await dio.get(
          'https://api.weatherapi.com/v1/forecast.json?key=5da0c61a1dc24f8889a155656231610&q=$address&days=5&aqi=yes&alerts=no');
      final data = res.data;
      WeatherModel result = WeatherModel.fromJson(data);
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
