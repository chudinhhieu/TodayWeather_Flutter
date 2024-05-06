import 'package:flutter/material.dart';
import 'package:today_weather/apps/utils/convert.dart';
import 'package:today_weather/models/model_weather.dart';
import 'package:today_weather/pages/home/widgets/temperature_item.dart';
import 'package:today_weather/pages/home/widgets/widget_forecast.dart';

// ignore: must_be_immutable
class WidgetDaily extends StatelessWidget {
  WidgetDaily({super.key, required this.data, required this.current});
  List<Forecastday> data;
  Current current;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<int> highTemperatures = MyConverter().maxTemp(data);
    List<int> lowTemperatures = MyConverter().minTemp(data);
    List<String> ngay = ['Hôm nay', 'Ngày mai', 'Ngày kia'];
    return SizedBox(
      height: size.width * 0.8,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          int highestTemp = highTemperatures[index];
          int lowestTemp = lowTemperatures[index];

          return Container(
            width: size.width * 0.922 / data.length,
            padding: const EdgeInsets.symmetric(vertical: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                TemperatureItem(
                  highestTemp: highestTemp,
                  lowestTemp: lowestTemp,
                  size: size,
                  maxTemp: MyConverter().findMax(highTemperatures),
                  minTemp: MyConverter().findMin(lowTemperatures),
                ),
                const SizedBox(height: 5),
                WidgetForecast(
                  size: size,
                  day: data[index].day,
                  date: ngay[index],
                  huong: current.windDir,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
