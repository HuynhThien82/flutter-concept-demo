import 'package:flutter_concept_demo/domain/installed_apps/model/installed_app.dart';

class InstalledAppMapper {
  static InstalledApp toInstalledApp(Map<dynamic, dynamic> map) {
    return InstalledApp(
        appName: map['appName'],
        packageName: map['packageName'],
        icon: map['icon']);
  }
}
