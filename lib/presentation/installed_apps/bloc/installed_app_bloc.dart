import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_concept_demo/domain/installed_apps/model/installed_app.dart';
import 'package:flutter_concept_demo/domain/installed_apps/usecase/get_installed_app.dart';

class InstalledAppBloc {
  final GetInstalledApps _getInstalledApps;

  // Stream controller
  final StreamController<List<InstalledApp>?> _installedAppsController =
      StreamController();

  // Stream
  Stream<List<InstalledApp>?> get getInstalledApps =>
      _installedAppsController.stream;

  // data
  List<InstalledApp>? installedApps;

  InstalledAppBloc({required GetInstalledApps getInstalledApps})
      : _getInstalledApps = getInstalledApps;

  void fetchInstalledApps() async {
    installedApps = await _getInstalledApps();
    debugPrint("installed apps size: ${installedApps?.length}");
    installedApps?.sort(((a, b) =>
        a.appName[0].toUpperCase().compareTo(b.appName[0].toLowerCase())));
    _installedAppsController.sink.add(installedApps);
  }
}
