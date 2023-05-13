import 'package:weatherapp_starter_project/models/weather_daily_data.dart';
import 'package:weatherapp_starter_project/models/weather_current_data.dart';


class WeatherData{

  final WeatherCurrentData? current;
  final WeatherDailyData? daily;

  WeatherData([this.current, this.daily]);


  WeatherCurrentData getCurrentWeather() => current!;
  WeatherDailyData getDailyWeather() => daily!;

}