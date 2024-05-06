import 'package:flutter/material.dart';
import 'package:today_weather/apps/utils/convert.dart';

// ignore: must_be_immutable
class WidgetDescription extends StatelessWidget {
  WidgetDescription(
      {super.key,
      this.trangThai,
      this.huongGio,
      this.tocDoGio,
      this.khaNangMua});
  String? trangThai;
  String? huongGio;
  double? tocDoGio;
  int? khaNangMua;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    huongGio = MyConverter().convertToVietnamese(huongGio!);
    return Row(
      children: [
        Expanded(
            flex: 10,
            child: Text(
              'Hôm nay - ${MyConverter().translateWeather(trangThai!)}. Gió $huongGio, tốc độ $tocDoGio km/h. '
              'Khả năng mưa $khaNangMua%.',
              style: TextStyle(color: Colors.grey[600], fontSize: 14),
            )),
        Expanded(
            flex: 1,
            child: IconButton(
                onPressed: () {},
                iconSize: size.width * 0.07,
                icon: Icon(
                  Icons.arrow_right,
                  color: Colors.grey[600],
                )))
      ],
    );
  }
}
