import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/models/preferences.dart';
import 'package:weatherapp_starter_project/widgets/daily_weather_forecast.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';

import 'package:weatherapp_starter_project/screens/settings_screen.dart';

class WeatherScreen extends StatefulWidget {
  final Preferences preferences;
  const WeatherScreen({super.key, required this.preferences});

  @override
  State<WeatherScreen> createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //settings button
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: _openSettings, icon: const Icon(Icons.settings))
        ],
      ),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return SafeArea(
            child: Obx(
              () => globalController.checkLoading().isTrue
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Center(
                      child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        const SizedBox(
                          height: 20,
                        ), //padding
                        HeaderWidget(
                          weatherDailyData: globalController
                              .getWeatherData()
                              .getDailyWeather(),
                          index: index,
                          preferences: widget.preferences,
                        ), // location and date
                        CurrentWeatherWidget(
                          weatherData: globalController.getWeatherData(),
                          index: index,
                          preferences: widget.preferences,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        DailyWeatherForecast(
                          weatherDailyData: globalController
                              .getWeatherData()
                              .getDailyWeather(),
                          index: index,
                        ),
                      ],
                    )),
            ),
          );
        },
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(),
      ),
    );
  }

  void _openSettings() async {
    await Navigator.of(context).push(
      PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SettingsScreen(preferences: widget.preferences),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: animation
                  .drive(Tween(begin: const Offset(0, 1), end: Offset.zero)),
              child: child,
            );
          }),
    );
    setState(() {
      widget.preferences;
    });
  }
}
