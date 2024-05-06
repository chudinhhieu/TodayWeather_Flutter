import 'dart:math';

import 'package:intl/intl.dart';
import 'package:today_weather/models/model_weather.dart';

class MyConverter {
  String convertToVietnamese(String direction) {
    Map<String, String> englishToVietnamese = {
      'N': 'Bắc',
      'NNE': 'Bắc-Tây Bắc',
      'NE': 'Đông Bắc',
      'ENE': 'Đông-Tây Bắc',
      'E': 'Đông',
      'ESE': 'Đông-Nam',
      'SE': 'Đông Nam',
      'SSE': 'Nam-Đông Nam',
      'S': 'Nam',
      'SSW': 'Nam-Tây Nam',
      'SW': 'Tây Nam',
      'WSW': 'Tây-Tây Nam',
      'W': 'Tây',
      'WNW': 'Tây-Tây Bắc',
      'NW': 'Tây Bắc',
      'NNW': 'Bắc-Tây Bắc',
    };

    return englishToVietnamese[direction] ?? 'Không xác định';
  }

  String translateWeather(String weather) {
    switch (weather) {
      case 'Sunny':
        return 'Nắng';
      case 'Partly cloudy':
        return 'Ít mây';
      case 'Cloudy':
        return 'Nhiều mây';
      case 'Overcast':
        return 'Âm u';
      case 'Mist':
        return 'Sương mù';
      case 'Patchy rain possible':
        return 'Mưa phùn đều đều';
      case 'Patchy snow possible':
        return 'Tuyết rơi phùn';
      case 'Patchy sleet possible':
        return 'Mưa tuyết phùn';
      case 'Patchy freezing drizzle possible':
        return 'Mưa phùn đóng băng';
      case 'Thundery outbreaks possible':
        return 'Có thể có sấm sét';
      case 'Blowing snow':
        return 'Tuyết gió';
      case 'Blizzard':
        return 'Bão tuyết';
      case 'Fog':
        return 'Sương mù';
      case 'Freezing fog':
        return 'Sương mù đóng băng';
      case 'Patchy light drizzle':
        return 'Mưa phùn nhẹ';
      case 'Light drizzle':
        return 'Mưa phùn nhẹ';
      case 'Freezing drizzle':
        return 'Mưa phùn đóng băng';
      case 'Heavy freezing drizzle':
        return 'Mưa phùn đóng băng nặng';
      case 'Patchy light rain':
        return 'Mưa nhẹ';
      case 'Light rain':
        return 'Mưa nhẹ';
      case 'Moderate rain at times':
        return 'Mưa vừa phải';
      case 'Moderate rain':
        return 'Mưa vừa';
      case 'Heavy rain at times':
        return 'Mưa to';
      case 'Heavy rain':
        return 'Mưa lớn';
      case 'Light freezing rain':
        return 'Mưa đóng băng nhẹ';
      case 'Moderate or heavy freezing rain':
        return 'Mưa đóng băng vừa hoặc lớn';
      case 'Light sleet':
        return 'Mưa tuyết nhẹ';
      case 'Moderate or heavy sleet':
        return 'Mưa tuyết vừa hoặc lớn';
      case 'Patchy light snow':
        return 'Tuyết nhẹ';
      case 'Light snow':
        return 'Tuyết nhẹ';
      case 'Patchy moderate snow':
        return 'Tuyết vừa';
      case 'Moderate snow':
        return 'Tuyết vừa';
      case 'Patchy heavy snow':
        return 'Tuyết nặng';
      case 'Heavy snow':
        return 'Tuyết nặng';
      case 'Ice pellets':
        return 'Mưa đá';
      case 'Light rain shower':
        return 'Mưa rào nhẹ';
      case 'Moderate or heavy rain shower':
        return 'Mưa rào vừa hoặc lớn';
      case 'Torrential rain shower':
        return 'Mưa rào ngập lụt';
      case 'Light sleet showers':
        return 'Mưa tuyết rào nhẹ';
      case 'Moderate or heavy sleet showers':
        return 'Mưa tuyết rào vừa hoặc lớn';
      case 'Light snow showers':
        return 'Tuyết rào nhẹ';
      case 'Moderate or heavy snow showers':
        return 'Tuyết rào vừa hoặc lớn';
      case 'Light showers of ice pellets':
        return 'Mưa đá nhẹ';
      case 'Moderate or heavy showers of ice pellets':
        return 'Mưa đá vừa hoặc lớn';
      case 'Patchy light rain with thunder':
        return 'Mưa nhẹ có sấm sét';
      case 'Moderate or heavy rain with thunder':
        return 'Mưa vừa hoặc lớn có sấm sét';
      case 'Patchy light snow with thunder':
        return 'Tuyết nhẹ có sấm sét';
      case 'Moderate or heavy snow with thunder':
        return 'Tuyết vừa hoặc lớn có sấm sét';
      default:
        return 'Không rõ';
    }
  }

  double laBan(String? direction) {
    double toRadian = pi / 180;
    Map<String, double> goc = {
      'N': 0 * toRadian,
      'NNE': 22.5 * toRadian,
      'NE': 45 * toRadian,
      'ENE': 67.5 * toRadian,
      'E': 90 * toRadian,
      'ESE': 112.5 * toRadian,
      'SE': 135 * toRadian,
      'SSE': 157.5 * toRadian,
      'S': 180 * toRadian,
      'SSW': 202.5 * toRadian,
      'SW': 225 * toRadian,
      'WSW': 247.5 * toRadian,
      'W': 270 * toRadian,
      'WNW': 292.5 * toRadian,
      'NW': 315 * toRadian,
      'NNW': 337.5 * toRadian,
    };

    return goc[direction] ?? 0;
  }

  String formatTime(String inputString) {
    DateFormat inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    DateTime dateTime = inputFormat.parse(inputString);

    DateFormat outputFormat = DateFormat('HH:mm');
    String outputString = outputFormat.format(dateTime);

    return outputString;
  }

  List<Hour> filterHours(List<Forecastday> forecastday) {
    DateTime now = DateTime.now();
    List<Hour> filteredHours = [];

    for (Forecastday day in forecastday) {
      List<Hour> hours = day.hour!;

      for (Hour hour in hours) {
        if (filteredHours.length >= 24) {
          break;
        }

        if (hour.time != null) {
          DateTime hourTime = DateTime.parse(hour.time!);

          if (hourTime.isAfter(now)) {
            filteredHours.add(hour);
          }
        }
      }

      if (filteredHours.length >= 24) {
        break;
      }
    }
    return filteredHours;
  }

  List<int> maxTemp(List<Forecastday> data) {
    List<int> list = [];
    for (var item in data) {
      int? max = item.day!.maxtempC;
      list.add(max!);
    }
    return list;
  }

  List<int> minTemp(List<Forecastday> data) {
    List<int> list = [];
    for (var item in data) {
      int? min = item.day!.mintempC;
      list.add(min!);
    }
    return list;
  }

  int findMax(List<int> numbers) {
    int maxNumber = numbers[0];
    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] > maxNumber) {
        maxNumber = numbers[i];
      }
    }
    return maxNumber;
  }

  int findMin(List<int> numbers) {
    int minNumber = numbers[0];
    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] < minNumber) {
        minNumber = numbers[i];
      }
    }
    return minNumber;
  }
}
