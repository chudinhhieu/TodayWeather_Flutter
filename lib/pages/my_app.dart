import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today_weather/apps/utils/const.dart';
import 'package:today_weather/pages/home/home_page.dart';
import 'package:today_weather/providers/weather_provider.dart';
import 'package:device_preview/device_preview.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      child: DevicePreview(
        enabled: kReleaseMode,
        builder: (context) => MaterialApp(
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          routes: {
            ConstRoute.RouteHome: (context) => const HomePage(),
          },
          initialRoute: ConstRoute.RouteHome,
        ),
      ),
    );
  }
}
