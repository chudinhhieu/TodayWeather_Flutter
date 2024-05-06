import 'package:flutter/material.dart';

class TemperatureItem extends StatelessWidget {
  final int highestTemp;
  final int lowestTemp;
  final int maxTemp;
  final int minTemp;
  final Size size;
  const TemperatureItem(
      {Key? key,
      required this.highestTemp,
      required this.lowestTemp,
      required this.size,
      required this.maxTemp,
      required this.minTemp})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    int tiLe = (maxTemp - minTemp);
    int tiLeMax = (maxTemp - highestTemp);
    int tiLeMin = (lowestTemp - minTemp);

    int tiLetemp = tiLe - (tiLeMax + tiLeMin);

    return SizedBox(
      height: size.height * 0.2151,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$highestTemp°', style: TextStyle(fontSize: size.width * 0.034)),
          Expanded(
            child: Column(
              children: [
                Expanded(flex: tiLeMax, child: Container()),
                Expanded(
                  flex: tiLetemp,
                  child: Container(
                    width: 5.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      gradient: const LinearGradient(
                        colors: [Colors.red, Colors.blue],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Expanded(flex: tiLeMin, child: Container()),
              ],
            ),
          ),
          Text('$lowestTemp°', style: TextStyle(fontSize: size.width * 0.034)),
        ],
      ),
    );
  }
}
