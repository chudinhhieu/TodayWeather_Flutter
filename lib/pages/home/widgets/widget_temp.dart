import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WidgetTemp extends StatelessWidget {
  WidgetTemp(
      {super.key,
      required this.temp,
      required this.tempMax,
      required this.tempMin});
  int? temp;
  int? tempMax;
  int? tempMin;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '$temp°C',
            style: TextStyle(
              fontSize: size.width * 0.17,
              fontWeight: FontWeight.w100,
            ),
          ),
          const SizedBox(width: 10),
          Row(children: [
            Container(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                '$tempMax°',
                style: TextStyle(
                    fontSize: size.width * 0.07, fontWeight: FontWeight.w100),
              ),
            ),
            Text(
              '/',
              style: TextStyle(
                  fontSize: size.width * 0.07, fontWeight: FontWeight.w100),
            ),
            Container(
              padding: const EdgeInsets.only(top: 22),
              child: Text(
                '$tempMin°',
                style: TextStyle(
                    fontSize: size.width * 0.07, fontWeight: FontWeight.w100),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
