import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/widgets/daily_weather_forecast.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State <HomeScreen> createState() =>  HomeScreenState();
}

class  HomeScreenState extends State <HomeScreen> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue ? const Center(
          child: CircularProgressIndicator(),
        )
        : Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const SizedBox(height: 20,), //padding
              const HeaderWidget(), // location and date
              CurrentWeatherWidget(
                weatherCurrentData: globalController.getWeatherData().getCurrentWeather(),
              ),
              const SizedBox(
                height:20,
              ),
              DailyWeatherForecast(
                weatherDailyData: globalController.getWeatherData().getDailyWeather(),
              ),
            ],
            )
          ),
        ),
      ),
    );
  }
}