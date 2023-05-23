import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/screens/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const NavBar(),
        title: "Weather",
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.dark,
        theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            primaryColor: const Color.fromRGBO(136, 153, 166, 1),
            scaffoldBackgroundColor: const Color.fromRGBO(0, 0, 25, 1)));
  }
}
