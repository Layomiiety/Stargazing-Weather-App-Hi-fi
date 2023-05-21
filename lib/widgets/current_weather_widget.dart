import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/weather/hourly.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/models/weather_daily_data.dart';
import 'package:fl_chart/fl_chart.dart';

class CurrentWeatherWidget extends StatefulWidget {
  final WeatherData weatherData;
  final int index;

  const CurrentWeatherWidget({
    Key? key,
    required this.weatherData,
    required this.index,
  }) : super(key: key);

  @override
  State<CurrentWeatherWidget> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeatherWidget> {
  bool showTemp = false;

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

  Widget getTimeTicks(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 9,
      child: Text(int.parse(getTime(value).substring(0, 2)) % 3 == 0
          ? getTime(value).substring(0, 2)
          : ""),
    );
  }

  Widget getIntTicks(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 9,
      child: Text(value - value.toInt() < 0.001 ? value.toString() : ""),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width / 2) - 30;
    final Daily daily = widget.weatherData.daily!.daily[widget.index];
    final List<Hourly> hourly = widget.weatherData.hourly!.hourly;
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
      SizedBox(
          height: 200,
          child: Padding(
              padding: const EdgeInsets.all(15),
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                        spots: hourly
                            .map((e) => FlSpot(e.dt!.toDouble(), e.temp!))
                            .toList(),
                        dotData: FlDotData(show: false),
                        isCurved: true)
                  ],
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: getTimeTicks,
                            interval: 3600)),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 44,
                          interval: 2,
                          getTitlesWidget: getIntTicks),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                ),
                swapAnimationDuration: const Duration(milliseconds: 150),
                // Optional
                swapAnimationCurve: Curves.linear, // Optional
              ))),
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
          basicInfoWidget(width, "assets/icons/sunset.png",
              getTime(daily.sunset), "Sunset"),
        ],
      ),
      Row(
        children: [
          basicInfoWidget(width, "assets/icons/moon.png",
              getTime(daily.moonrise), "Moonrise"),
          basicInfoWidget(width, "assets/icons/wind.png",
              "${daily.windSpeed}m/s", "Wind speed"),
        ],
      ),
    ]);
  }

  Widget basicInfoWidget(width, image, mainText, description) {
    return Card(
        clipBehavior: Clip.hardEdge,
        margin: const EdgeInsets.only(top: 15, bottom: 20, left: 20),
        child: InkWell(
            child: Container(
                height: 100,
                width: width,
                padding: const EdgeInsets.all(10),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // text for current weather info
                          SizedBox(
                            // padding: const EdgeInsets.only(left: 5),
                            width: width - 80,
                            child: Text(
                              mainText,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Ysabeau',
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: CustomColors.textwhitecolor,
                              ),
                            ),
                          ),

                          SizedBox(
                              width: width - 80,
                              child: Text(
                                description,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'HandWritten',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ))
                        ]),
                  ],
                )),
            onTap: () {}));
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
