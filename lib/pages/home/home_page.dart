import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:today_weather/apps/utils/convert.dart';
import 'package:today_weather/models/model_weather.dart';
import 'package:today_weather/pages/home/widgets/widget_daily.dart';
import 'package:today_weather/pages/home/widgets/widget_date.dart';
import 'package:today_weather/pages/home/widgets/widget_description.dart';
import 'package:today_weather/pages/home/widgets/widget_detail.dart';
import 'package:today_weather/pages/home/widgets/widget_hourly.dart';
import 'package:today_weather/pages/home/widgets/widget_image_weather.dart';
import 'package:today_weather/pages/home/widgets/widget_temp.dart';
import 'package:today_weather/providers/weather_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _addressController = TextEditingController();
  WeatherModel? _weatherData;
  @override
  void initState() {
    super.initState();
    context.read<WeatherProvider>().getWeatherCurrent(_addressController.text);
  }

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  void _showAddressInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Nhập địa chỉ'),
          content: TextField(
            controller: _addressController,
            decoration: InputDecoration(hintText: 'Nhập địa chỉ...'),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Hủy',
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () async {
                String enteredAddress = _addressController.text;
                WeatherModel weatherData = await context
                    .read<WeatherProvider>()
                    .getWeatherCurrent(enteredAddress);
                setState(() {
                  _weatherData = weatherData;
                });
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Text(
                'Đồng ý',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      endDrawer: Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
        width: size.width * 2 / 3 + 5,
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => _showAddressInputDialog(context),
                          icon: const Icon(Icons.manage_search_outlined),
                        ),
                        const SizedBox(width: 10),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.settings),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: false,
        title: Text(
          DateFormat.Hm().format(DateTime.now()),
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: FutureBuilder(
            initialData: null,
            future: _weatherData != null
                ? Future.value(_weatherData)
                : context
                    .read<WeatherProvider>()
                    .getWeatherCurrent(_addressController.text),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: CircularProgressIndicator(color: Colors.blueAccent),
                  ),
                );
              }
              if (!snapshot.hasData) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: const Center(
                    child: Text('Không có dữ liệu!'),
                  ),
                );
              }
              WeatherModel data = snapshot.data as WeatherModel;
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ImageWeather(statusWeather: data.current!.condition!.text),
                    WidgetTemp(
                      temp: data.current!.tempC,
                      tempMax: data.forecast!.forecastday![0].day!.maxtempC,
                      tempMin: data.forecast!.forecastday![0].day!.mintempC,
                    ),
                    const WidgetDate(),
                    Text(
                      data.location!.name.toString(),
                      style: TextStyle(
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      MyConverter().translateWeather(
                          data.current!.condition!.text.toString()),
                      style: TextStyle(
                          fontSize: size.width * 0.037,
                          fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(height: 7),
                    WidgetDescription(
                      trangThai: data.current!.condition!.text,
                      huongGio: data.current!.windDir,
                      tocDoGio: data.current!.windKph,
                      khaNangMua:
                          data.forecast!.forecastday![0].day!.dailyChanceOfRain,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'CHI TIẾT',
                      style: TextStyle(
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                          fontSize: size.width * 0.033),
                    ),
                    const SizedBox(height: 20),
                    WidgetDetail(
                      camGiac: data.current!.feelslikeC,
                      doAm: data.current!.humidity,
                      uv: data.current!.uv,
                      tamNhin: data.current!.visKm,
                      tocDoGio: data.current!.windKph,
                      apSuat: data.current!.pressureMb,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          flex: 10,
                          child: Text(
                            'HÀNG GIỜ',
                            style: TextStyle(
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w500,
                                fontSize: size.width * 0.033),
                          ),
                        ),
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
                    ),
                    const SizedBox(height: 20),
                    WidgetHourly(
                      dataForecastday: data.forecast!.forecastday!,
                      timeNow: data.location!.localtime,
                    ),
                    const SizedBox(height: 20),
                    Row(children: [
                      Expanded(
                        flex: 10,
                        child: Text(
                          'HÀNG NGÀY',
                          style: TextStyle(
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w500,
                              fontSize: size.width * 0.033),
                        ),
                      ),
                      Expanded(
                          flex: 1,
                          child: IconButton(
                              onPressed: () {},
                              iconSize: size.width * 0.07,
                              icon: Icon(
                                Icons.arrow_right,
                                color: Colors.grey[600],
                              ))),
                    ]),
                    const SizedBox(height: 10),
                    WidgetDaily(
                        data: data.forecast!.forecastday!,
                        current: data.current!),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
