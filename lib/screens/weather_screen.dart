import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/widgets/daily_weather_forecast.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';

import 'package:weatherapp_starter_project/settings/settings_screen.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  bool _showSettingsPage = false;

  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    if (_showSettingsPage) {
      return const SettingsScreen();
    }
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
      body: SafeArea(
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
                    const HeaderWidget(), // location and date
                    CurrentWeatherWidget(
                      weatherCurrentData:
                          globalController.getWeatherData().getCurrentWeather(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DailyWeatherForecast(
                      weatherDailyData:
                          globalController.getWeatherData().getDailyWeather(),
                    ),
                  ],
                )),
        ),
      ),
    );
  }

  void _openSettings() {
    setState(() {
      _showSettingsPage = true;
    });
  }
}
