import "package:flutter/material.dart";
import 'package:weatherapp_starter_project/models/weather_current_data.dart';
import 'package:weatherapp_starter_project/utils/custom_colors.dart';


class CurrentWeatherWidget extends StatelessWidget {
  final WeatherCurrentData weatherCurrentData;

  const CurrentWeatherWidget({super.key, required this.weatherCurrentData});


  @override
  Widget build(BuildContext context) {
    final width = (MediaQuery.of(context).size.width/2) - 50;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          temperatureAreaWidget(),

          const SizedBox(
            height:15,
          ),

          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BasicInfoWidget(
                    width,
                    "assets/icons/temp.png",
                    "${weatherCurrentData.current.temp!.toInt()}°",
                    "${weatherCurrentData.current.weather![0].description}"),

                BasicInfoWidget(
                    width,
                    "assets/icons/clouds.png",
                    "${weatherCurrentData.current.clouds!.toInt()}%",
                    "cloud cover")
              ]),

          Row(
            children: [
              BasicInfoWidget(width,
                  "assets/icons/humidity.png",
                  "${weatherCurrentData.current.humidity!.toInt()}%",
                  "humidity"),
              BasicInfoWidget(
                  width,
                  "assets/icons/visibility.png",
                  "${weatherCurrentData.current.visibility!.toInt()}m",
                  "visibility")
            ],
          ),


          Row(
            children: [
              // windspeed
              BasicInfoWidget(width,
                  "assets/icons/wind_speed.png",
                  "${weatherCurrentData.current.windSpeed!.toInt()}m/s",
                  "wind speed"),
              BasicInfoWidget(width,
                  "assets/icons/feelslike.png",
                  "${weatherCurrentData.current.feelsLike!.toInt()}°",
                  "feels like")
            ],
          ),


          // Row(
          //   children: [
          //     BasicInfoWidget(width,
          //         "assets/icons/temp.png",
          //         "${weatherCurrentData.current.temp!.toInt()}°",
          //         "description"),
          //     BasicInfoWidget(width, image, mainText, description)
          //   ],
          // ),


        ]
    );
  }



  Widget BasicInfoWidget(width, image, mainText, description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 100,
          width: width,
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: CustomColors.boxcolor.withAlpha(150),
              borderRadius: BorderRadius.circular(20)
          ),
          child: Row(
            children: [
              // background for image
              Container(
                height: 60,
                width: 60,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: CustomColors.cardcolor,
                    borderRadius: BorderRadius.circular(35)
                ),
                // actual image
                child: Image.asset(image),
              ),
              Container(
                height: 60,
                width: 10,
              ),

              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // text for current weather info
                    Text(
                      mainText,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: CustomColors.textwhitecolor,
                      ),
                    ),

                    Text(
                      description,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    )
                  ]),
            ],
          ),
        )
      ],
    );
  }


  Widget temperatureAreaWidget(){
    //print(weatherCurrentData.current.temp!.toInt());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Image.asset(
          "assets/weather/${weatherCurrentData.current.weather![0].icon}.png",
          height: 80,
          width: 80,

        ),
        Container(
          height: 50,
          width: 1,
          color: CustomColors.dividecolor,
        ),
        RichText(text: TextSpan(children: [
          TextSpan(
              text: "${weatherCurrentData.current.temp!.toInt()}°",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 68,
                color: CustomColors.textwhitecolor,
              )
          ),
          TextSpan(
              text: "${weatherCurrentData.current.weather![0].description}",
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Colors.grey,
              )
          ),
        ]
        ),
        )
      ],
    );
  }
}