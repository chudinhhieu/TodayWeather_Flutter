import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WidgetDate extends StatelessWidget {
  const WidgetDate({super.key});
  @override
  Widget build(BuildContext context) {
    String thuNgayThang =
        DateFormat.MMMMEEEEd('vi').format(DateTime.now()).toUpperCase();
    Size size = MediaQuery.of(context).size;

    return Text(
      thuNgayThang,
      style: TextStyle(
          fontSize: size.width * 0.028,
          fontWeight: FontWeight.w400,
          color: Colors.grey[500]),
    );
  }
}
