import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetch_weather.dart';
import 'package:weatherapp_starter_project/models/weather_data.dart';

class GlobalController extends GetxController{
  final RxBool _isLoading = true.obs;
  final RxDouble _latitude = 0.0.obs;
  final RxDouble _longitude = 0.0.obs;

  RxBool checkLoading() => _isLoading;
  RxDouble getLatitude() => _latitude;
  RxDouble getLongitude() => _longitude;


  final weatherData = WeatherData().obs;
  getWeatherData(){
    return weatherData.value;
  }

  @override
  void onInit() {
    getLocation();
    super.onInit();
  }


  getLocation() async {
    //_isLoading.value = false;
    bool isServiceEnabled;
    LocationPermission locationPermission;
    isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled){
      return Future.error("LOCATION service is not available");
    }

    await Geolocator.checkPermission();

    locationPermission = await Geolocator.checkPermission();
    // check if location permission is granted
    if(locationPermission == LocationPermission.deniedForever){
      return Future.error("LOCATION PERMISSION IS DENIED FOREVER");
    }
    else if(locationPermission == LocationPermission.denied){
      locationPermission = await Geolocator.requestPermission();
      if(locationPermission == LocationPermission.denied){
        return Future.error("LOCATION PERMISSION IS DENIED");
      } 
    }

    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high)
    .then((value) {
      _latitude.value = value.latitude;
      _longitude.value = value.longitude;

      // calling openWeatherMap api
      return FetchWeatherAPI().processData(value.latitude, value.longitude)
      .then((value) {
        weatherData.value = value;
        _isLoading.value = false;
      });    
    });
    // return (value) {
    //   _latitude.value = 52.1951;
    //   _longitude.value = 0.1313;
    //   _isLoading.value = false;
    // };

  }
}