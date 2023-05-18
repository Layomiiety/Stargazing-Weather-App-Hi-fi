import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

import '../models/weather_daily_data.dart';


class CurrentWeatherWidget extends StatelessWidget {
  final WeatherDailyData weatherDailyData;
  final int index;
  const CurrentWeatherWidget({Key? key,
    required this.weatherDailyData,
    required this.index,
  }
  ): super(key: key);
  String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }
  String getTime(final epochTime) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
    final formattedTime = DateFormat('hh:mm').format(time);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    final Daily daily = weatherDailyData.daily[index];
    return Column(
      children: [
        //temperatureAreaWidget(daily),

        const SizedBox(
          height:15,
        ),
        CurrentWeatherWidget_1(daily),

        CurrentWeatherWidget_2(daily),

        CurrentWeatherWidget_3(daily),
        CurrentWeatherWidget_4(daily),


      ]
    );
  }

  Widget CurrentWeatherWidget_1(daily){
    return
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //temperature
            Container(
              height: 119,
              width: 210,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              decoration: BoxDecoration(
                color: CustomColors.boxcolor.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children:[
                  Row(
                children:[
                Container(
                  height: 60,
                  width: 60,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: CustomColors.cardcolor,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Image.asset("assets/weather/${daily.weather![0].icon}.png"),
                ),
              const SizedBox(
                height:60,
                width: 20,
                //color: CustomColors.dividecolor
              ),
              RichText(text: TextSpan(children: [
                TextSpan(
                    text: "${daily.temp.day!.toInt()}°C",
                    style: const TextStyle(
                      fontFamily: 'Ysabeau',
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: CustomColors.textwhitecolor,
                    )
                ),
              ])),
              ]),
                  const SizedBox(
                    height:5,
                  ),
                  RichText(text: const TextSpan(children: [
                    TextSpan(
                        text: "Temperature",
                        style: TextStyle(
                          fontFamily: 'HandWritten',
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          color: CustomColors.textwhitecolor,
                        )
                    ),
                  ])),
                ])),
            //cloud cover
            Container(
                height: 118,
                width: 210,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: CustomColors.boxcolor.withAlpha(150),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                    children:[
                      Row(
                          children:[
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
                            const SizedBox(
                              height:60,
                              width: 20,
                              //color: CustomColors.dividecolor
                            ),
                            RichText(text: TextSpan(children: [
                              TextSpan(
                                  text: "${daily.clouds!.toInt()}%",
                                  style: const TextStyle(
                                    fontFamily: 'HandWritten',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 28,
                                    color: CustomColors.textwhitecolor,
                                  )
                              ),
                            ])),
                          ]),
                      const SizedBox(
                        height:4,
                      ),
                      RichText(text: const TextSpan(children: [
                        TextSpan(
                            text: "Cloud Cover",
                            style: TextStyle(
                              fontFamily: 'HandWritten',
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: CustomColors.textwhitecolor,
                            )
                        ),
                      ])),
                    ])),
          ],
        );
  }

  Widget CurrentWeatherWidget_2(daily){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //humidity
          Container(
              height: 119,
              width: 210,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              decoration: BoxDecoration(
                color: CustomColors.boxcolor.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  children:[
                    Row(
                        children:[
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
                          const SizedBox(
                            height:60,
                            width: 20,
                            //color: CustomColors.dividecolor
                          ),
                          RichText(text: TextSpan(children: [
                            TextSpan(
                                text: "${daily.humidity!.toInt()}%",
                                style: const TextStyle(
                                  fontFamily: 'Ysabeau',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: CustomColors.textwhitecolor,
                                )
                            ),
                          ])),
                        ]),
                    const SizedBox(
                      height:5,
                    ),
                    RichText(text: const TextSpan(children: [
                      TextSpan(
                          text: "Humidity",
                          style: TextStyle(
                            fontFamily: 'HandWritten',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: CustomColors.textwhitecolor,
                          )
                      ),
                    ])),
                  ])),
          //precipitation
          Container(
              height: 118,
              width: 210,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: CustomColors.boxcolor.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  children:[
                    Row(
                        children:[
                          Container(
                            height: 55,
                            width: 60,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: CustomColors.cardcolor,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Image.asset("assets/icons/rain.png"),
                          ),
                          const SizedBox(
                            height:55,
                            width: 20,
                            //color: CustomColors.dividecolor
                          ),
                          RichText(text: TextSpan(children: [
                            TextSpan(
                                text: "${daily.rain!.toInt()}%",
                                style: const TextStyle(
                                  fontFamily: 'Ysabeau',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: CustomColors.textwhitecolor,
                                )
                            ),
                          ])),
                        ]),
                    const SizedBox(
                      height:9,
                    ),
                    RichText(text: const TextSpan(children: [
                      TextSpan(
                          text: "Precipitation",
                          style: TextStyle(
                            fontFamily: 'HandWritten',
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: CustomColors.textwhitecolor,
                          )
                      ),
                    ])),
                  ])),
        ],
      );
  }
  Widget CurrentWeatherWidget_3(daily){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //sunrise
          Container(
              height: 119,
              width: 210,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              decoration: BoxDecoration(
                color: CustomColors.boxcolor.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  children:[
                    Row(
                        children:[
                          Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: CustomColors.cardcolor,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Image.asset("assets/icons/sunrise.png"),
                          ),
                          const SizedBox(
                            height:60,
                            width: 20,
                            //color: CustomColors.dividecolor
                          ),
                          RichText(text: TextSpan(children: [
                            TextSpan(
                                text: "${getTime(daily.sunrise)}",
                                style: const TextStyle(
                                  fontFamily: 'Ysabeau',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: CustomColors.textwhitecolor,
                                )
                            ),
                          ])),
                        ]),
                    const SizedBox(
                      height:5,
                    ),
                    RichText(text: const TextSpan(children: [
                      TextSpan(
                          text: "Sunrise",
                          style: TextStyle(
                            fontFamily: 'HandWritten',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: CustomColors.textwhitecolor,
                          )
                      ),
                    ])),
                  ])),
          //sun
          Container(
              height: 119,
              width: 210,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              decoration: BoxDecoration(
                color: CustomColors.boxcolor.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  children:[
                    Row(
                        children:[
                          Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: CustomColors.cardcolor,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Image.asset("assets/icons/sunrise.png"),
                          ),
                          const SizedBox(
                            height:60,
                            width: 20,
                            //color: CustomColors.dividecolor
                          ),
                          RichText(text: TextSpan(children: [
                            TextSpan(
                                text: "${getTime(daily.sunset)}",
                                style: const TextStyle(
                                  fontFamily: 'Ysabeau',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: CustomColors.textwhitecolor,
                                )
                            ),
                          ])),
                        ]),
                    const SizedBox(
                      height:5,
                    ),
                    RichText(text: const TextSpan(children: [
                      TextSpan(
                          text: "Sunset",
                          style: TextStyle(
                            fontFamily: 'HandWritten',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: CustomColors.textwhitecolor,
                          )
                      ),
                    ])),
                  ]))
        ],
      );
  }
  Widget CurrentWeatherWidget_4(daily){
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //moonrise
          Container(
              height: 119,
              width: 210,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
              decoration: BoxDecoration(
                color: CustomColors.boxcolor.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  children:[
                    Row(
                        children:[
                          Container(
                            height: 60,
                            width: 60,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: CustomColors.cardcolor,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Image.asset("assets/icons/moon.png"),
                          ),
                          const SizedBox(
                            height:60,
                            width: 20,
                            //color: CustomColors.dividecolor
                          ),
                          RichText(text: TextSpan(children: [
                            TextSpan(
                                text: "${getTime(daily.moonrise)}",
                                style: const TextStyle(
                                  fontFamily: 'Ysabeau',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: CustomColors.textwhitecolor,
                                )
                            ),
                          ])),
                        ]),
                    const SizedBox(
                      height:5,
                    ),
                    RichText(text: const TextSpan(children: [
                      TextSpan(
                          text: "Moonrise",
                          style: TextStyle(
                            fontFamily: 'HandWritten',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: CustomColors.textwhitecolor,
                          )
                      ),
                    ])),
                  ])),
          //cloud cover
          Container(
              height: 118,
              width: 210,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: CustomColors.boxcolor.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  children:[
                    Row(
                        children:[
                          Container(
                            height: 50,
                            width: 60,
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: CustomColors.cardcolor,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Image.asset("assets/icons/wind.png"),
                          ),
                          const SizedBox(
                            height:50,
                            width: 20,
                            //color: CustomColors.dividecolor
                          ),
                          RichText(text: TextSpan(children: [
                            TextSpan(
                                text: "${daily.windSpeed!.toInt()}m/s",
                                style: const TextStyle(
                                  fontFamily: 'Ysabeau',
                                  fontWeight: FontWeight.w600,
                                  fontSize: 30,
                                  color: CustomColors.textwhitecolor,
                                )
                            ),
                          ])),
                        ]),
                    const SizedBox(
                      height:8,
                    ),
                    RichText(text: const TextSpan(children: [
                      TextSpan(
                          text: "Wind",
                          style: TextStyle(
                            fontFamily: 'HandWritten',
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                            color: CustomColors.textwhitecolor,
                          )
                      ),
                    ])),
                  ])),
        ],
      );
  }
  Widget temperatureAreaWidget(daily){
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
      RichText(text: TextSpan(children: [
        TextSpan(
          text: "${daily.temp!.toInt()}°",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 68,
            color: CustomColors.textblackcolor,
          )
        ),
        TextSpan(
          text: "${daily.weather![0].description}",
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