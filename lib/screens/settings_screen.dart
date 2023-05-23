import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:weatherapp_starter_project/models/preferences.dart';
import 'package:weatherapp_starter_project/screens/weather_screen.dart';

import 'news_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key, required this.from});

  final String from;

  @override
  State<SettingsScreen> createState() => SettingsState();
}

class SettingsState extends State<SettingsScreen> {
  int pageIndex = 0;
  late List<Widget> _pages;

  bool _closeSettings = false;

  MaterialApp privacyPolicyPage() {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => {_switchPage(0)},
                  icon: const Icon(Icons.arrow_left)),
              title: const Text('Privacy Policy'),
            ),
            body: const Column(
              children: [
                Text('Insert Privacy Policy Here'),
              ],
            )));
  }

  Column favouriteLocationsColumn() {
    List<String> l = Preferences.favouriteLocations;

    List<Widget> w = <Widget>[];
    for (int i = 0; i < l.length; i++) {
      w.add(Row(
        children: [
          Text(l[i]),
          TextButton(
              onPressed: () => {_removeFavouriteLocation(i)},
              child: const Text('X'))
        ],
      ));
    }

    return Column(children: w);
  }

  MaterialApp settingsPage() {
    const List<String> dateFormatsList = <String>[
      'MMMM dd,yyyy',
      'ddMMMMyyyy',
      'MMMM dd',
      'ddMMMM'
    ];
    const List<String> temperatureUnitsList = <String>['°C', '°F'];
    const List<String> visibilityUnitsList = <String>['km', 'm', 'ft', 'miles'];
    const List<String> windSpeedUnitsList = <String>[
      'km/h',
      'm/s',
      'ft/s',
      'mph',
      'knots'
    ];

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                leading: BackButton(onPressed: _exitSettings),
                title: const Text('Settings')),
            body: Column(
              children: [
                Center(
                    child: Column(
                  children: [
                    const Text('Units'),
                    Row(children: [
                      const Text('Date Format'),
                      DropdownButton(
                          value: Preferences.dateFormat,
                          items: dateFormatsList
                              .map<DropdownMenuItem<String>>((String s) {
                            return DropdownMenuItem<String>(
                                value: s, child: Text(s));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              Preferences.dateFormat = value!;
                            });
                          })
                    ]),
                    Row(children: [
                      const Text('Temperature'),
                      DropdownButton(
                          value: Preferences.temperatureUnits,
                          items: temperatureUnitsList
                              .map<DropdownMenuItem<String>>((String s) {
                            return DropdownMenuItem<String>(
                                value: s, child: Text(s));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              Preferences.temperatureUnits = value!;
                            });
                          })
                    ]),
                    Row(children: [
                      const Text('Visibility'),
                      DropdownButton(
                          value: Preferences.visibilityUnits,
                          items: visibilityUnitsList
                              .map<DropdownMenuItem<String>>((String s) {
                            return DropdownMenuItem<String>(
                                value: s, child: Text(s));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              Preferences.visibilityUnits = value!;
                            });
                          })
                    ]),
                    Row(children: [
                      const Text('Wind Speed'),
                      DropdownButton(
                          value: Preferences.windSpeedUnits,
                          items: windSpeedUnitsList
                              .map<DropdownMenuItem<String>>((String s) {
                            return DropdownMenuItem<String>(
                                value: s, child: Text(s));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              Preferences.windSpeedUnits = value!;
                            });
                          })
                    ]),
                  ],
                )),
                Center(
                    child: Column(children: [
                  const Text('Location'),
                  Row(
                    children: [
                      const Text('Use current location'),
                      Checkbox(
                          value: Preferences.useCurrentLocation,
                          onChanged: (bool? value) {
                            setState(() {
                              Preferences.useCurrentLocation = value!;
                            });
                          })
                    ],
                  ),
                  Row(
                    children: [
                      const Text('Favourites:'),
                      TextButton(
                          onPressed: () => {_switchPage(2)},
                          child: const Text('+'))
                    ],
                  ),
                  favouriteLocationsColumn()
                ])),
                Center(
                    child: TextButton(
                        onPressed: () => {_switchPage(1)},
                        child: const Text('Privacy Policy')))
              ],
            )));
  }

  MaterialApp addFavouritesPage() {
    String lt = 'Location';
    var msgController = TextEditingController();
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () => {_switchPage(0)},
                  icon: const Icon(Icons.arrow_left)),
              title: const Text('Add Favourite Location'),
            ),
            body: Center(
                child: TextField(
              controller: msgController,
              decoration:
                  InputDecoration(border: OutlineInputBorder(), labelText: lt),
              onSubmitted: (String? value) {
                setState(() {
                  Preferences.favouriteLocations.add(value!);
                  pageIndex = 0;
                  msgController.clear();
                });
              },
            ))));
  }

  void _switchPage(int x) {
    setState(() {
      pageIndex = x;
    });
  }

  void _exitSettings() {
    setState(() {
      _closeSettings = true;
    });
  }

  void _removeFavouriteLocation(int x) {
    setState(() {
      Preferences.favouriteLocations.removeAt(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_closeSettings) {
      late Widget ret;
      switch (widget.from) {
        case "news":
          {
            ret = const NewsScreen();
          }
          break;
        case "weather":
          {
            ret = const WeatherScreen();
          }
      }
      return ret;
    }
    _pages = <Widget>[settingsPage(), privacyPolicyPage(), addFavouritesPage()];
    return Scaffold(body: IndexedStack(index: pageIndex, children: _pages));
  }
}
