import "package:flutter/material.dart";
import 'package:weatherapp_starter_project/models/weather_current_data.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

import 'package:weatherapp_starter_project/settings/Preferences.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final WeatherCurrentData weatherCurrentData;

  const CurrentWeatherWidget({super.key, required this.weatherCurrentData});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      temperatureAreaWidget(),
      const SizedBox(
        height: 15,
      ),
      CurrentWeatherWidget_1(),
      CurrentWeatherWidget_2(),
      CurrentWeatherWidget_3(),
      CurrentWeatherWidget_4(),
    ]);
  }

  Widget CurrentWeatherWidget_1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //temperature
        Container(
            height: 100,
            width: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/temp.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    //text: "${weatherCurrentData.current.temp!.toInt()}°",
                    text: Preferences.getTempInUnits(
                        weatherCurrentData.current.temp!.toInt()),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: CustomColors.textwhitecolor,
                    )),
                TextSpan(
                    text:
                        "${weatherCurrentData.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ])),
            ])),
        //cloud cover
        Container(
            height: 100,
            width: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/clouds.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "${weatherCurrentData.current.clouds!.toInt()}%",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: CustomColors.textwhitecolor,
                    )),
                TextSpan(
                    text:
                        "${weatherCurrentData.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ])),
            ])),
      ],
    );
  }

  Widget CurrentWeatherWidget_2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //humidity
        Container(
            height: 100,
            width: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/humidity.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "${weatherCurrentData.current.humidity!.toInt()}%",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: CustomColors.textwhitecolor,
                    )),
                TextSpan(
                    text:
                        "${weatherCurrentData.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ])),
            ])),
        //visibility
        Container(
            height: 100,
            width: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/visibility.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    //text: "${weatherCurrentData.current.visibility!.toInt()}m",
                    text: Preferences.getVisibilityInUnits(
                        weatherCurrentData.current.visibility!.toInt()),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: CustomColors.textwhitecolor,
                    )),
                // TextSpan(
                //     text: "${weatherCurrentData.current.weather![0].description}",
                //     style: const TextStyle(
                //       fontWeight: FontWeight.w400,
                //       fontSize: 14,
                //       color: Colors.grey,
                //     )
                // ),
              ])),
            ])),
      ],
    );
  }

  Widget CurrentWeatherWidget_3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //windspeed
        Container(
            height: 100,
            width: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/wind_speed.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    //text: "${weatherCurrentData.current.windSpeed!.toInt()}m/s",
                    text: Preferences.getWindSpeedInUnits(
                        weatherCurrentData.current.windSpeed!.toInt()),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                      color: CustomColors.textwhitecolor,
                    )),
                TextSpan(
                    text:
                        "${weatherCurrentData.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ])),
            ])),
        //feelslike
        Container(
            height: 100,
            width: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/feelslike.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    //text: "${weatherCurrentData.current.feelsLike!.toInt()}°",
                    text: Preferences.getTempInUnits(
                        weatherCurrentData.current.feelsLike!.toInt()),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: CustomColors.textwhitecolor,
                    )),
                TextSpan(
                    text:
                        "${weatherCurrentData.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ])),
            ])),
      ],
    );
  }

  Widget CurrentWeatherWidget_4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //temperature
        Container(
            height: 100,
            width: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/temp.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    //text: "${weatherCurrentData.current.temp!.toInt()}°",
                    text: Preferences.getTempInUnits(
                        weatherCurrentData.current.temp!.toInt()),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: CustomColors.textwhitecolor,
                    )),
                TextSpan(
                    text:
                        "${weatherCurrentData.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ])),
            ])),
        //cloud cover
        Container(
            height: 100,
            width: 200,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/clouds.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "${weatherCurrentData.current.clouds!.toInt()}%",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: CustomColors.textwhitecolor,
                    )),
                TextSpan(
                    text:
                        "${weatherCurrentData.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ])),
            ])),
      ],
    );
  }

  Widget CurrentWeatherWidget_5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        //temperature
        Container(
            height: 100,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/temp.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    //text: "${weatherCurrentData.current.temp!.toInt()}°",
                    text: Preferences.getTempInUnits(
                        weatherCurrentData.current.temp!.toInt()),
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: CustomColors.textwhitecolor,
                    )),
                TextSpan(
                    text:
                        "${weatherCurrentData.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ])),
            ])),
        //cloud cover
        Container(
            height: 100,
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(children: [
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: CustomColors.cardcolor,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Image.asset("assets/icons/clouds.png"),
              ),
              Container(
                height: 60,
                width: 10,
                //color: CustomColors.dividecolor
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                    text: "${weatherCurrentData.current.clouds!.toInt()}%",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 35,
                      color: CustomColors.textwhitecolor,
                    )),
                TextSpan(
                    text:
                        "${weatherCurrentData.current.weather![0].description}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    )),
              ])),
            ])),
      ],
    );
  }

  Widget temperatureAreaWidget() {
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
        RichText(
          text: TextSpan(children: [
            TextSpan(
                //text: "${weatherCurrentData.current.temp!.toInt()}°",
                text: Preferences.getTempInUnits(
                    weatherCurrentData.current.temp!.toInt()),
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CustomColors.textblackcolor,
                )),
            TextSpan(
                text: "${weatherCurrentData.current.weather![0].description}",
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
