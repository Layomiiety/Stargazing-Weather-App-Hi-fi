import 'package:weatherapp_starter_project/models/weather/daily.dart';

class WeatherDailyData {
  List<Daily> daily;

  WeatherDailyData({required this.daily});

  factory WeatherDailyData.fromJson(Map<String, dynamic> json) =>
      WeatherDailyData(
          daily: List<Daily>.from(json['daily'].map((_) => Daily.fromJson(_))));
}
