import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:today_weather/pages/my_app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  initializeDateFormatting('vi', null).then((_) {
    runApp(const MyApp());
  });
}
