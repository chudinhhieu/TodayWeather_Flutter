import 'package:flutter/material.dart';
import 'package:today_weather/apps/utils/my_theme.dart';

// ignore: must_be_immutable
class ItemDetail extends StatelessWidget {
  ItemDetail(
      {super.key,
      required this.size,
      required this.icon,
      required this.name,
      required this.value});
  Size size;
  String name;
  String value;
  IconData icon;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      height: (size.width - 62) / 3,
      decoration: BoxDecoration(
        color: MyColor.myGrey,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Expanded(
              flex: 10,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    icon,
                    color: Colors.black87,
                    size: size.width * 0.07,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    name,
                    style: TextStyle(
                        fontSize: size.width * 0.029,
                        color: const Color(0xFF686868)),
                  )
                ],
              )),
          Expanded(
              flex: 9,
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  value,
                  style: TextStyle(
                      fontWeight: FontWeight.w100, fontSize: size.width * 0.06),
                ),
              ))
        ],
      ),
    ));
  }
}
