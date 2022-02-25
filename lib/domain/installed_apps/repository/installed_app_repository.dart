import 'package:flutter_concept_demo/domain/installed_apps/model/installed_app.dart';

abstract class InstalledAppReposiory {
  Future<List<InstalledApp>> getInstalledApps();
}
