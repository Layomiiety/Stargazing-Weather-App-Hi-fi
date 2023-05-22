import 'package:weatherapp_starter_project/models/weather/daily.dart';

class WeatherQuantity {
  String title;
  String icon;
  bool detailsVisible = false;
  bool detailsEnabled;
  String Function(Daily) value;

  WeatherQuantity({
    required this.title,
    required this.value,
    required this.icon,
    required this.detailsEnabled,
  });
}
