import 'package:flutter/material.dart';
import 'package:today_weather/pages/home/widgets/widget_item_detail.dart';

// ignore: must_be_immutable
class WidgetDetail extends StatelessWidget {
  WidgetDetail(
      {super.key,
      this.camGiac,
      this.uv,
      this.doAm,
      this.tamNhin,
      this.tocDoGio,
      this.apSuat});
  int? camGiac;
  int? doAm;
  int? uv;
  double? tamNhin;
  double? tocDoGio;
  int? apSuat;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            ItemDetail(
                size: size * 0.9,
                icon: Icons.thermostat,
                name: 'Cảm Giác Như',
                value: '$camGiac°C'),
            const SizedBox(width: 15),
            ItemDetail(
                size: size * 0.9,
                icon: Icons.opacity_sharp,
                name: 'Độ Ẩm',
                value: '$doAm%'),
            const SizedBox(width: 15),
            ItemDetail(
                size: size * 0.9,
                icon: Icons.light_mode_outlined,
                name: 'Chỉ Số UV',
                value: '$uv'),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            ItemDetail(
                size: size * 0.9,
                icon: Icons.remove_red_eye_outlined,
                name: 'Tầm Nhìn',
                value: '$tamNhin km'),
            const SizedBox(width: 15),
            ItemDetail(
                size: size * 0.9,
                icon: Icons.air_outlined,
                name: 'Tốc Độ Gió',
                value: '$tocDoGio km/s'),
            const SizedBox(width: 15),
            ItemDetail(
                size: size * 0.9,
                icon: Icons.speed_rounded,
                name: 'Áp Suất',
                value: '$apSuat'),
          ],
        ),
      ],
    );
  }
}
