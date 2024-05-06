import 'package:flutter/material.dart';
import 'package:today_weather/api/api_weather.dart';
import 'package:today_weather/models/model_weather.dart';

class WeatherProvider extends ChangeNotifier {
  Future<WeatherModel> getWeatherCurrent(String address) async {
    WeatherModel result = await ApiCurrent.callApiCurrent(address);
    return result;
  }
}
