import 'package:flutter/material.dart';
import 'package:today_weather/apps/utils/convert.dart';
import 'package:today_weather/models/model_weather.dart';
import 'package:today_weather/pages/home/widgets/widget_forecast.dart';

// ignore: must_be_immutable
class WidgetHourly extends StatelessWidget {
  WidgetHourly(
      {super.key, required this.dataForecastday, required this.timeNow});
  List<Forecastday> dataForecastday;
  String? timeNow;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Hour> data = MyConverter().filterHours(dataForecastday);
    return SizedBox(
      height: size.width * 0.45,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            width: size.width * 0.185,
            padding: const EdgeInsets.symmetric(vertical: 7),
            margin: const EdgeInsets.only(right: 4),
            decoration: BoxDecoration(
              border: Border.all(width: 1, color: Colors.black12),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Text(
                  '${data[index].tempC}°',
                  style: TextStyle(
                    fontSize: size.width * 0.038,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                WidgetForecast(size: size, hour: data[index]),
              ],
            ),
          );
        },
      ),
    );
  }
}
