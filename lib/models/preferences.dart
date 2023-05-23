/* import 'package:flutter/material.dart'; */

class Preferences {
  String temperatureUnits = '°C';
  String windSpeedUnits = 'm/s';
  String visibilityUnits = 'km';
  String dateFormat = 'MMMM dd,yyyy';
  bool useCurrentLocation = true;
  List<String> favouriteLocations = <String>[];

  static double round(double x, int d) {
    return double.parse(x.toStringAsFixed(d));
  }

  double getTempInUnits(double x) {
    switch (temperatureUnits) {
      case '°C':
        {
          return round(x, 1);
        }
      case '°F':
        {
          return round(x * 9 / 5 + 32, 1);
        }
    }
    return 0;
  }

  String tempFormat(double x) {
    return '${getTempInUnits(x).toInt()} $temperatureUnits';
  }

  double getWindSpeedInUnits(double x) {
    switch (windSpeedUnits) {
      case 'km/h':
        {
          return round(3.6 * x, 1);
        }
      case 'm/s':
        {
          return x;
        }
      case 'ft/s':
        {
          return round(3.28084 * x, 1);
        }
      case 'mph':
        {
          return round(2.23694 * x, 1);
        }
      case 'knots':
        {
          return round(1.94384 * x, 1);
        }
    }
    return 0;
  }

  String windFormat(double x) {
    return '${getWindSpeedInUnits(x)} $windSpeedUnits';
  }

  String getVisibilityInUnits(int x) {
    late int ret;
    switch (visibilityUnits) {
      case 'km':
        {
          double temp = x / 1000;
          ret = temp.toInt();
        }
        break;
      case 'm':
        {
          ret = x;
        }
        break;
      case 'ft':
        {
          double temp = 3.28084 * x;
          ret = temp.toInt();
        }
        break;
      case 'miles':
        {
          double temp = 0.000621371 * x;
          ret = temp.toInt();
        }
        break;
    }
    return '$ret $visibilityUnits';
  }
}
