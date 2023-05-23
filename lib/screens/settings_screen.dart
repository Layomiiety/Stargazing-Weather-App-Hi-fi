import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/preferences.dart';

class SettingsScreen extends StatefulWidget {
  final Preferences preferences;
  const SettingsScreen({super.key, required this.preferences});

  @override
  State<SettingsScreen> createState() => SettingsState();
}

class SettingsState extends State<SettingsScreen> {
  int pageIndex = 0;

  List<ListTile> favouriteLocationsColumn() {
    List<String> l = widget.preferences.favouriteLocations;

    List<ListTile> w = [];
    for (int i = 0; i < l.length; i++) {
      w.add(_customTile(
          l[i],
          IconButton(
              onPressed: () => {_removeFavouriteLocation(i)},
              icon: const Icon(Icons.clear))));
    }
    return w;
  }

  ListTile _dropdownTile(String title, String preferencesValue,
      void Function(String) setter, List<String> options) {
    return ListTile(
        title: Padding(
            padding: const EdgeInsets.only(left: 15), child: Text(title)),
        trailing: DropdownButton(
            value: preferencesValue,
            items: options
                .map<DropdownMenuItem<String>>(
                    (s) => DropdownMenuItem<String>(value: s, child: Text(s)))
                .toList(),
            onChanged: (String? value) {
              setState(() {
                setter(value!);
              });
            }));
  }

  ListTile _customTile(String title, Widget trailing) {
    return ListTile(
        title: Padding(
            padding: const EdgeInsets.only(left: 15), child: Text(title)),
        trailing: trailing);
  }

  ListTile _headerTile(String title) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          )),
    );
  }

  Widget settingsPage() {
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

    return Scaffold(
        appBar: AppBar(
            leading: BackButton(onPressed: _exitSettings),
            title: const Text('Settings')),
        body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView(
              children: [
                    _headerTile('Units'),
                    _dropdownTile(
                        'Date Format',
                        widget.preferences.dateFormat,
                        (e) => widget.preferences.dateFormat = e,
                        dateFormatsList),
                    _dropdownTile(
                        'Temperature',
                        widget.preferences.temperatureUnits,
                        (e) => widget.preferences.temperatureUnits = e,
                        temperatureUnitsList),
                    _dropdownTile(
                        'Visibility',
                        widget.preferences.visibilityUnits,
                        (e) => widget.preferences.visibilityUnits = e,
                        visibilityUnitsList),
                    _dropdownTile(
                        'Wind Speed',
                        widget.preferences.windSpeedUnits,
                        (e) => widget.preferences.windSpeedUnits = e,
                        windSpeedUnitsList),
                    _headerTile('Location'),
                    _customTile(
                        'Use current location',
                        Switch(
                            value: widget.preferences.useCurrentLocation,
                            onChanged: (bool? value) {
                              setState(() {
                                widget.preferences.useCurrentLocation = value!;
                              });
                            })),
                    _customTile(
                        "Favourites:",
                        IconButton(
                            onPressed: () => addFavourite(),
                            icon: const Icon(Icons.add)))
                  ] +
                  favouriteLocationsColumn() +
                  [
                    ListTile(
                        title: TextButton(
                            onPressed: () => {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const PrivacyPolicyPage()))
                                },
                            child: const Text('Privacy Policy')))
                  ],
            )));
  }

  void addFavourite() {
    var textFieldController = TextEditingController();
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: const Text('Add Favourite Location'),
              content: TextField(
                onChanged: (value) {},
                controller: textFieldController,
                decoration: const InputDecoration(labelText: "Location"),
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    setState(() {
                      widget.preferences.favouriteLocations
                          .add(textFieldController.value.text);
                      Navigator.pop(context);
                    });
                  },
                ),
              ]);
        });
  }

  void _exitSettings() {
    Navigator.pop(context);
  }

  void _removeFavouriteLocation(int x) {
    setState(() {
      widget.preferences.favouriteLocations.removeAt(x);
    });
  }

  @override
  Widget build(BuildContext context) {
    return settingsPage();
  }
}

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () => {Navigator.pop(context)}),
          title: const Text('Privacy Policy'),
        ),
        body: const Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                Text('Insert Privacy Policy Here'),
              ],
            )));
  }
}
