import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/models/preferences.dart';
import 'package:weatherapp_starter_project/screens/news_screen.dart';
import 'package:weatherapp_starter_project/screens/weather_screen.dart';
import 'package:weatherapp_starter_project/screens/map_screen.dart';

class NavBar extends StatefulWidget {
  // This class is the configuration for the state.
  // It holds the values (in this case nothing) provided
  // by the parent and used by the build  method of the
  // State. Fields in a Widget subclass are always marked
  // "final".
  final Preferences preferences;
  const NavBar({super.key, required this.preferences});

  @override
  State<NavBar> createState() => _NavbarState();
}

class _NavbarState extends State<NavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called,
    // for instance, as done by the _increment method above.
    // The Flutter framework has been optimized to make
    // rerunning build methods fast, so that you can just
    // rebuild anything that needs updating rather than
    // having to individually changes instances of widgets.
    final List<Widget> pages = <Widget>[
      WeatherScreen(
        preferences: widget.preferences,
      ),
      const MapScreen(),
      NewsScreen(
        preferences: widget.preferences,
      ),
      const Icon(
        Icons.chat,
        size: 150,
      ),
    ];

    return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: const <NavigationDestination>[
            NavigationDestination(
              icon: Icon(Icons.sunny),
              label: 'Weather',
            ),
            NavigationDestination(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
            NavigationDestination(
              icon: Icon(Icons.newspaper),
              label: 'News',
            ),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedIndex: _selectedIndex,
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: pages,
        ));
  }
}
