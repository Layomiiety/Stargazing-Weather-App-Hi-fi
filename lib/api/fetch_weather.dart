import 'dart:convert';
import 'package:weatherapp_starter_project/models/weather_daily_data.dart';
import 'package:weatherapp_starter_project/utils/api_url.dart';
import 'package:weatherapp_starter_project/models/weather_current_data.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';
import 'package:http/http.dart' as http;



class FetchWeatherAPI{

  WeatherData? weatherData;

  Future<WeatherData> processData(lat, lon)async {
    var response = await http.get(Uri.parse(api_url(lat, lon)));
    var jsonString = jsonDecode(response.body);
    //fetch weather data
    weatherData = WeatherData(WeatherCurrentData.fromJson(jsonString), WeatherDailyData.fromJson(jsonString));

    return weatherData!;
  }

}





