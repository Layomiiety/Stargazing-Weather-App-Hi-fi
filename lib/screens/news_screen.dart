import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controllers/global_controller.dart';
import 'package:weatherapp_starter_project/screens/settings_screen.dart';

import 'package:weatherapp_starter_project/widgets/news_boxes_widget.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  bool _showSettingsPage = false;
  final GlobalController globalController =
      Get.put(GlobalController(), permanent: true);
  @override
  Widget build(BuildContext context) {
    if (_showSettingsPage) {
      return const SettingsScreen(from: "news");
    }
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Settings button
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: _openSettings, icon: const Icon(Icons.settings))
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => globalController.checkLoading().isTrue
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: ListView(
                  scrollDirection: Axis.vertical,
                  children: const [
                    SizedBox(
                      height: 20,
                    ),
                    NewsBoxes(),
                  ],
                )),
        ),
      ),
    );
  }

  void _openSettings() {
    setState(() {
      _showSettingsPage = true;
    });
  }
}
