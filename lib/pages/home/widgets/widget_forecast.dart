import 'package:flutter/material.dart';
import 'package:today_weather/apps/utils/const.dart';
import 'package:today_weather/apps/utils/convert.dart';
import 'package:today_weather/models/model_weather.dart';

// ignore: must_be_immutable
class WidgetForecast extends StatelessWidget {
  WidgetForecast(
      {super.key,
      required this.size,
      this.hour,
      this.day,
      this.date,
      this.huong});
  Size size;
  Hour? hour;
  Day? day;
  String? date;
  String? huong;
  @override
  Widget build(BuildContext context) {
    int? khaNangMua;
    String? icon;
    num? tocDoGio;
    String? thoiGian;
    double? huongGio;
    if (hour != null) {
      khaNangMua = hour!.chanceOfRain;
      icon = hour!.condition!.icon;
      tocDoGio = hour!.windKph;
      thoiGian = MyConverter().formatTime(hour!.time!);
      huongGio = MyConverter().laBan(hour!.windDir);
    } else {
      khaNangMua = day!.dailyChanceOfRain;
      icon = day!.condition!.icon;
      tocDoGio = day!.maxwindKph;
      thoiGian = date;
      huongGio = MyConverter().laBan(huong);
    }
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '$khaNangMua %',
            style: TextStyle(
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.w400,
              color: Colors.blueAccent[400],
            ),
          ),
          Image.network(
            'https:$icon',
            height: size.width * 0.09,
            width: size.width * 0.09,
          ),
          Text(
            '$tocDoGio km/h',
            style: TextStyle(
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          Transform.rotate(
              angle: huongGio,
              child: Image.asset(
                ConstImage.up_arrow,
                width: size.width * 0.05,
                height: size.width * 0.05,
              )),
          Text(
            thoiGian!,
            style: TextStyle(
              fontSize: size.width * 0.035,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
