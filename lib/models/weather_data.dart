import 'package:weatherapp_starter_project/models/weather_daily_data.dart';
import 'package:weatherapp_starter_project/models/weather_current_data.dart';
import 'package:weatherapp_starter_project/models/weather_hourly_data.dart';

class WeatherData {
  final WeatherCurrentData? current;
  final WeatherDailyData? daily;
  final WeatherHourlyData? hourly;

  WeatherData([this.current, this.daily, this.hourly]);

  WeatherCurrentData getCurrentWeather() => current!;
  WeatherDailyData getDailyWeather() => daily!;
  WeatherHourlyData getHourlyWeather() => hourly!;
}
