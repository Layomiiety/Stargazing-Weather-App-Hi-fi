import "package:flutter/material.dart";
import 'package:weatherapp_starter_project/models/weather_current_data.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';


class CurrentWeatherWidget extends StatelessWidget {
  final WeatherCurrentData weatherCurrentData;

  const CurrentWeatherWidget({super.key, required this.weatherCurrentData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        temperatureAreaWidget(),

        const SizedBox(
          height:15,
        ),
        CurrentWeatherMoreDetailsWidget(),


      ]
    );
  }

  Widget CurrentWeatherMoreDetailsWidget(){
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardcolor,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
             Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardcolor,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
             Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomColors.cardcolor,
                borderRadius: BorderRadius.circular(35),
              ),
              child: Image.asset("assets/icons/windspeed.png"),
            ),
          ],
        )]
    );
  }

  Widget temperatureAreaWidget(){
    //print(weatherCurrentData.current.temp!.toInt());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      Image.asset(
        "assets/weather/${weatherCurrentData.current.weather![0].icon}.png",
        height: 80,
        width: 80,

      ),
      Container(
        height: 50,
        width: 1,
        color: CustomColors.dividecolor,
      ),
      RichText(text: TextSpan(children: [
        TextSpan(
          text: "${weatherCurrentData.current.temp!.toInt()}°",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 68,
            color: CustomColors.textblackcolor,
          )
        ),
        TextSpan(
          text: "${weatherCurrentData.current.weather![0].description}",
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            color: Colors.grey,
          )
        ),
        ]
        ),
      )
    ],  
    );
  }
}