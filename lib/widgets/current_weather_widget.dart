import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

import 'package:weatherapp_starter_project/settings/Preferences.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDailyData weatherDailyData;
  final int index;

  const CurrentWeatherWidget({
    Key? key,
    required this.weatherDailyData,
    required this.index,
  }) : super(key: key);


  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  String getTime(final epochTime) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
    final formattedTime = DateFormat('HH:mm').format(time);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) - 30;
    final Daily daily = weatherDailyData.daily[index];
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      temperatureAreaWidget(daily),
      const SizedBox(
        height: 15,
      ),
      Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            basicInfoWidget(width, "assets/icons/temp.png",
                "${daily.temp!.night}°", "${daily.weather![0].description}"),
            basicInfoWidget(width, "assets/icons/clouds.png",
                "${daily.clouds!.toInt()}%", "Cloud Cover")
          ]),
      Row(
        children: [
          basicInfoWidget(width, "assets/icons/humidity.png",
              "${daily.humidity!.toInt()}%", "Humidity"),
          basicInfoWidget(width, "assets/icons/rain.png",
              "${daily.windSpeed!.toInt()}%", "Precipitation")
        ],
      ),
      Row(
        children: [
          basicInfoWidget(width, "assets/icons/sunrise.png",
              getTime(daily.sunrise), "Sunrise"),
          basicInfoWidget(
              width, "assets/icons/sunset.png", getTime(daily.sunset), "Sunset"),
        ],
      ),
      Row(
        children: [
          basicInfoWidget(
              width, "assets/icons/moon.png", getTime(daily.moonrise), "Moonrise"),
          basicInfoWidget(width, "assets/icons/wind.png", "${daily.windSpeed}m/s",
              "Wind speed"),
        ],
      ),
    ]);
  }

  Widget basicInfoWidget(width, image, mainText, description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: width,
          margin: const EdgeInsets.only(top: 15, bottom: 20, left: 20),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            children: [
              // background for image
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: CustomColors.cardcolor,
                    borderRadius: BorderRadius.circular(35)),
                // actual image
                child: Image.asset(image),
              ),

              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // text for current weather info
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        mainText,
                        style: const TextStyle(
                          fontFamily: 'Ysabeau',
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                          color: CustomColors.textwhitecolor,
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        description,
                        style: const TextStyle(
                          fontFamily: 'HandWritten',
                          fontWeight: FontWeight.w400,
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      )
                    )
                  ]),
            ],
          ),
        )
      ],
    );
  }

  Widget temperatureAreaWidget(Daily daily) {
    //print(weatherCurrentData.current.temp!.toInt());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${daily.weather![0].icon}.png",
          height: 80,
          width: 80,
        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividecolor,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "${daily.temp!.night}°",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CustomColors.textwhitecolor,
                )),
            TextSpan(
                text: "${daily.weather![0].description}",
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: Colors.grey,
                )),
          ]),
        )
      ],
    );
  }
}
