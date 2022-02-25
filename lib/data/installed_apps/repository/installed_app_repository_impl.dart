import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_concept_demo/data/installed_apps/mapper/installed_app_mapper.dart';
import 'package:flutter_concept_demo/domain/installed_apps/model/installed_app.dart';
import 'package:flutter_concept_demo/domain/installed_apps/repository/installed_app_repository.dart';

class InstalledAppRepositoryImpl extends InstalledAppReposiory {
  @override
  Future<List<InstalledApp>> getInstalledApps() async {
    debugPrint("vao repository");
    MethodChannel channel = const MethodChannel("flutter_demo");
    var listMap = await channel.invokeMethod('getInstalledApps')
        as List<Map<dynamic, dynamic>>;
    debugPrint("apps size: ${listMap.length}");
    var apps = <InstalledApp>[];
    for (var element in listMap) {
      apps.add(InstalledAppMapper.toInstalledApp(element));
    }
    return apps;
  }
}
