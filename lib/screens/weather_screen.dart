import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/widgets/daily_weather_forecast.dart';
import 'package:weatherapp_starter_project/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/widgets/current_weather_widget.dart';


class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State <WeatherScreen> createState() =>  WeatherScreenState();
}

class  WeatherScreenState extends State <WeatherScreen> {
  final GlobalController globalController = Get.put(GlobalController(), permanent: true);
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemBuilder: (context, index){
          return SafeArea(child: Obx(() => globalController.checkLoading().isTrue ? const Center(
            child: CircularProgressIndicator(),
          )
              : Center(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(height: 20,), //padding
                  HeaderWidget(
                    weatherDailyData: globalController.getWeatherData().getDailyWeather(),
                    index: index,
                  ), // location and date
                  CurrentWeatherWidget(
                    weatherDailyData: globalController.getWeatherData().getDailyWeather(),
                    index: index,
                  ),
                  const SizedBox(
                    height:20,
                  ),
                  DailyWeatherForecast(
                    weatherDailyData: globalController.getWeatherData().getDailyWeather(),
                    index: index,
                  ),
                ],
              )
          ),
          ),);
        },
        itemCount: 3,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        onPageChanged: (index){
          setState(() {
            currentpage = index;
          });
          print(index);
        },

      ),
    );
  }
}