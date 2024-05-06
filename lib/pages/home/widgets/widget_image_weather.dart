import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageWeather extends StatelessWidget {
  ImageWeather({super.key, required this.statusWeather});
  String? statusWeather;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    statusWeather =
        'assets/images/${statusWeather!.replaceAll(" ", "").toLowerCase()}.jpg';
    print(statusWeather);
    return SizedBox(
      height: size.width,
      width: size.width,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          statusWeather!,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
