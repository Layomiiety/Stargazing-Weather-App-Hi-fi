import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/weather_daily_data.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class DailyWeatherForecast extends StatelessWidget {
  final WeatherDailyData weatherDailyData;
  final int index;
  const DailyWeatherForecast({Key? key,
    required this.weatherDailyData,
    required this.index,
  }): super(key: key);

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 220,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: CustomColors.dividecolor.withAlpha(150),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(children: [
          Container(
            alignment:Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 15),
            child: const Text("Next Days", style: TextStyle(color: CustomColors.textblackcolor, fontSize: 17),
            ),
          ),
          dailyList(),
        ],)
    );
  }

  Widget dailyList() {
    return SizedBox(
      height: 150,
      child:
      ListView.builder(

        scrollDirection: Axis.horizontal,
        itemCount: weatherDailyData.daily.length > 7 ? 7 : weatherDailyData.daily.length,
        itemBuilder: (context, index) {
          return Row(
              children: [
                Container(
                  height: 150,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        Text(getDay(weatherDailyData.daily[index].dt),
                            style: const TextStyle(color: CustomColors.textblackcolor, fontSize: 15)),
                        SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset("assets/weather/${weatherDailyData.daily[index].weather![0].icon}.png"),
                        ),
                        Text(
                          "${weatherDailyData.daily[index].temp!.max}° / ${weatherDailyData.daily[index].temp!.min}°",
                        )
                      ]),
                ),
                Container(
                  height: 150,
                  width: 1,
                  color: CustomColors.dividecolor,
                )
              ]
          );},
      ),
    );
  }
}
