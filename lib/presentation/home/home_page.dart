import 'package:flutter/material.dart';

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
          onPressed: () {},
          child: const Text("Count"),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Weather"),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("Installed Apps"),
        ),
          ],
        ),
      ),
    );
  }
}
