/* import 'package:flutter/material.dart'; */

class Preferences {
  static String temperatureUnits = '°C';
  static String windSpeedUnits = 'm/s';
  static String visibilityUnits = 'km';
  static String dateFormat = 'MMMM dd,yyyy';
  static bool useCurrentLocation = true;
  static List<String> favouriteLocations = <String>[];

  static String getTempInUnits(int x) {
    late int ret;
    switch (temperatureUnits) {
      case '°C':
        {
          ret = x;
        }
        break;
      case '°F':
        {
          double temp = x * 9 / 5 + 32;
          ret = temp.toInt();
        }
        break;
    }
    return '$ret $temperatureUnits';
  }

  static String getWindSpeedInUnits(int x) {
    late int ret;
    switch (windSpeedUnits) {
      case 'km/h':
        {
          double temp = 3.6 * x;
          ret = temp.toInt();
        }
        break;
      case 'm/s':
        {
          ret = x;
        }
        break;
      case 'ft/s':
        {
          double temp = 3.28084 * x;
          ret = temp.toInt();
        }
        break;
      case 'mph':
        {
          double temp = 2.23694 * x;
          ret = temp.toInt();
        }
        break;
      case 'knots':
        {
          double temp = 1.94384 * x;
          ret = temp.toInt();
        }
        break;
    }
    return '$ret $windSpeedUnits';
  }

  static String getVisibilityInUnits(int x) {
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

  static String getDateFormat() {
    late String ret;
    switch (dateFormat) {
      case 'MMMM dd,yyyy':
        {
          ret = 'yMMMMd';
        }
        break;
      case 'ddMMMMyyyy':
        {
          ret = 'dMMMMy';
        }
        break;
      case 'MMMM dd':
        {
          ret = 'MMMMd';
        }
        break;
      case 'ddMMMM':
        {
          ret = 'dMMMM';
        }
        break;
    }
    return ret;
  }
}
