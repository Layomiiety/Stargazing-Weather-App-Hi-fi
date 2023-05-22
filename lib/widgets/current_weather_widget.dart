import "package:flutter/material.dart";
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/models/weather/hourly.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:weatherapp_starter_project/models/weather_quantity.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/models/weather/daily.dart';
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
  List<WeatherQuantity> quantities = [
    WeatherQuantity(
        title: "Temperature",
        value: (e) => "${e.temp!.night?.toInt()}°",
        icon: "assets/icons/temp.png",
        detailsEnabled: true),
    WeatherQuantity(
        title: "Cloud Cover",
        value: (e) => "${e.clouds.toString()}%",
        icon: "assets/icons/clouds.png",
        detailsEnabled: true),
    WeatherQuantity(
        title: "Humidity",
        value: (e) => "${e.humidity.toString()}%",
        icon: "assets/icons/humidity.png",
        detailsEnabled: true),
    WeatherQuantity(
        title: "Precipitation",
        value: (e) => "${(e.pop! * 100).toInt()}%",
        icon: "assets/icons/rain.png",
        detailsEnabled: true),
    WeatherQuantity(
        title: "Sunrise",
        value: (e) => getTime(e.sunrise!),
        icon: "assets/icons/sunrise.png",
        detailsEnabled: false),
    WeatherQuantity(
        title: "Sunset",
        value: (e) => getTime(e.sunset!),
        icon: "assets/icons/sunset.png",
        detailsEnabled: false),
    WeatherQuantity(
        title: "Moonrise",
        value: (e) => getTime(e.moonrise!),
        icon: "assets/icons/moon.png",
        detailsEnabled: false),
    WeatherQuantity(
        title: "Wind Speed",
        value: (e) => "${e.windSpeed} m/s",
        icon: "assets/icons/wind.png",
        detailsEnabled: true),
  ];

  String getDay(final day) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    final x = DateFormat('EEE').format(time);
    return x;
  }

  static String getTime(final int epochTime) {
    DateTime time = DateTime.fromMillisecondsSinceEpoch(epochTime * 1000);
    final formattedTime = DateFormat('HH:mm').format(time);
    return formattedTime;
  }

  Widget getTimeTicks(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 9,
      child: Text(int.parse(getTime(value.toInt()).substring(0, 2)) % 4 == 0
          ? getTime(value.toInt()).substring(0, 2)
          : ""),
    );
  }

  Widget getIntTicks(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 9,
      child: value == meta.min || value == meta.max
          ? Container()
          : Text(value.toInt().toString()),
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
      Row(children: [
        basicInfoWidget(width, quantities[0], daily),
        basicInfoWidget(width, quantities[1], daily),
      ]),
      detailsWidget(hourly, 0, (e) => e.temp!),
      detailsWidget(hourly, 1, (e) => e.clouds!.toDouble()),
      Row(
        children: [
          basicInfoWidget(width, quantities[2], daily),
          basicInfoWidget(width, quantities[3], daily),
        ],
      ),
      detailsWidget(hourly, 2, (e) => e.humidity!.toDouble()),
      detailsWidget(hourly, 3, (e) => (e.pop! * 100)),
      Row(
        children: [
          basicInfoWidget(width, quantities[4], daily),
          basicInfoWidget(width, quantities[5], daily),
        ],
      ),
      Row(
        children: [
          basicInfoWidget(width, quantities[6], daily),
          basicInfoWidget(width, quantities[7], daily),
        ],
      ),
      detailsWidget(hourly, 7, (e) => e.windSpeed!.toDouble()),
    ]);
  }

  Widget basicInfoWidget(width, WeatherQuantity quantity, Daily daily) {
    return Card(
        clipBehavior: Clip.hardEdge,
        color: (quantity.detailsVisible
            ? CustomColors.boxColor
            : Theme.of(context).cardColor),
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
                          color: CustomColors.cardColor,
                          borderRadius: BorderRadius.circular(35)),
                      // actual image
                      child: Image.asset(quantity.icon),
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
                              quantity.value(daily),
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontFamily: 'Ysabeau',
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                                color: CustomColors.textWhiteColor,
                              ),
                            ),
                          ),

                          SizedBox(
                              width: width - 80,
                              child: Text(
                                quantity.title,
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
            onTap: () {
              if (quantity.detailsEnabled) {
                setState(() {
                  for (int i = 0; i < quantities.length; i++) {
                    if (quantities[i] != quantity) {
                      quantities[i].detailsVisible = false;
                    }
                  }
                  quantity.detailsVisible = !quantity.detailsVisible;
                });
              }
            }));
  }

  Widget detailsWidget(hourly, index, double Function(Hourly h) propFunction) {
    return AnimatedContainer(
      height: quantities[index].detailsVisible ? 200 : 0,
      // decoration: const BoxDecoration(color: CustomColors.boxColor),
      duration: const Duration(milliseconds: 200),
      child: Visibility(
          visible: quantities[index].detailsVisible,
          child: Card(
              color: CustomColors.boxColor,
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: Padding(
                  padding: const EdgeInsets.only(top: 15, right: 15),
                  child: LineChart(
                    LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                            spots: hourly
                                .map<FlSpot>((e) =>
                                    FlSpot(e.dt!.toDouble(), propFunction(e)))
                                .toList(),
                            dotData: FlDotData(show: false),
                            isCurved: true)
                      ],
                      titlesData: FlTitlesData(
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            getTitlesWidget: (value, meta) => Container(),
                            showTitles: true,
                            reservedSize: 10,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 40,
                                getTitlesWidget: getTimeTicks,
                                interval: 3600)),
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            reservedSize: 50,
                            getTitlesWidget: getIntTicks,
                          ),
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
                  )))),
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
          color: CustomColors.divideColor,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "${daily.temp!.night}°",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 68,
                  color: CustomColors.textWhiteColor,
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
