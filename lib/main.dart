import 'package:flutter/material.dart';
import 'package:flutter_concept_demo/di/injection_container.dart';
import 'package:flutter_concept_demo/presentation/count/stateful_page.dart';
import 'package:flutter_concept_demo/presentation/home/home_page.dart';
import 'package:flutter_concept_demo/presentation/installed_apps/installed_app_page.dart';

void main() async {
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: HomePage.route,
      routes: {
        HomePage.route: (context) => const HomePage(),
        StatefulPage.route: ((context) =>
            const StatefulPage(title: "Stateful Page")),
        InstalledAppPage.route: (context) => InstalledAppPage(bloc: getIt()),
      },
    );
  }
}
