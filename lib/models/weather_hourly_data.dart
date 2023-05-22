import 'package:weatherapp_starter_project/models/weather/hourly.dart';

class WeatherHourlyData {
  List<Hourly> hourly;
  WeatherHourlyData({required this.hourly});

  factory WeatherHourlyData.fromJson(Map<String, dynamic> json) =>
      WeatherHourlyData(
          hourly:
              List<Hourly>.from(json['hourly'].map((_) => Hourly.fromJson(_))));
}
