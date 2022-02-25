import 'package:flutter/material.dart';
import 'package:flutter_concept_demo/presentation/count/stateful_page.dart';
import 'package:flutter_concept_demo/presentation/installed_apps/installed_app_page.dart';

class HomePage extends StatelessWidget {
  static const route = "/";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter Concept Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, StatefulPage.route);
              },
              child: const Text("Count"),
            ),
            TextButton(
              onPressed: () {},
              child: const Text("Weather"),
            ),
            TextButton(
              onPressed: () {
                debugPrint("Clicked");
                Navigator.pushNamed(context, InstalledAppPage.route);
              },
              child: const Text("Installed Apps"),
            ),
          ],
        ),
      ),
    );
  }
}
