import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/weather_daily_data.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';

class DailyWeatherForecast extends StatelessWidget {
  final WeatherDailyData weatherDailyData;
  const DailyWeatherForecast({Key? key, required this.weatherDailyData}): super(key: key);


    String getDay(final day){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
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
      height: 300, 
      child:
      ListView.builder(
      
        scrollDirection: Axis.vertical,
        itemCount: weatherDailyData.daily.length > 7 ? 7 : weatherDailyData.daily.length,
        itemBuilder: (context, index) {
          return Column(
          children: [
            Container(
              height: 60,
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 80,
                    child: Text(getDay(weatherDailyData.daily[index].dt), style: TextStyle(color: CustomColors.textblackcolor, fontSize: 15)),
                    ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/weather/${weatherDailyData.daily[index].weather![0].icon}.png"),
                  ),
                  Text(
                    "${weatherDailyData.daily[index].temp!.max}°/${weatherDailyData.daily[index].temp!.min}°",
                  )
                  ]),
            ),
            Container(
              height: 1,
              color: CustomColors.dividecolor,
            )
          ]
        );},
      ),
    );
  }
}

