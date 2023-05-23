# Group 11 (Stargazing)
## Running
There are 2 options for running.
### Web version
A web version of the application is available at <https://weather.cfalas.com>. The web version has a few issues:
- The location doesn't always seem to work, sometimes requiring a long time until the weather shows up
- The map doesn't support overlays (Google Maps SDK still doesn't [support](https://github.com/flutter/packages/pull/3538) this.
- Changing to other days' forecast is not very user-friendly, since horizontal scrolling is not always available and usually very sensitive

However, these features work on the Android version, and we didn't have time to investigate the issues further.

### Android version
In order to run the Android version, you either need an Android phone, or a computer with an Android emulator, as described [here](https://developer.android.com/design-for-safety/privacy-sandbox/download#emulator).
Then, you can install the built application using the following command in the terminal:
```
adb install /path/to/downloaded/stargazing.apk
```

## Libraries
Our application is built on top of [Flutter](https://flutter.dev/). In addition to the framework itself, we used the following libraries:
- google_maps_flutter: Showing the maps and the overlay on the maps screen
- url_launcher, webview_flutter: Opening web pages in the browser
- fl_chart: Temperature charts
- geocoding: Getting the user’s location
- geolocator: Getting the user’s location
- http: All web requests for accessing web resources
- material: Google’s Material Design widgets

The data we present come from the following sources:
- [OpenWeatherMap OneAPI](https://openweathermap.org/): Current weather, weather forecast
- [LightPollutionMap](https://www.lightpollutionmap.info): Providing the tiles for the map overlay for both light pollution and cloud cover
- [Go Stargazing](https://gostargazing.co.uk): Providing the locations for the recommended stargazing spots in the UK
- [StarWalk](https://starwalk.space/en/news): The news shown on the news page
