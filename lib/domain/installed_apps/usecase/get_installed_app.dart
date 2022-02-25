import 'package:flutter_concept_demo/domain/common/usecase.dart';
import 'package:flutter_concept_demo/domain/installed_apps/repository/installed_app_repository.dart';

import '../model/installed_app.dart';

class GetInstalledApps extends UseCase<List<InstalledApp>, NoParams> {
  final InstalledAppReposiory _reposiory;

  GetInstalledApps({required InstalledAppReposiory installedAppReposiory})
      : _reposiory = installedAppReposiory;

  @override
  Future<List<InstalledApp>> call([NoParams? params]) {
    return _reposiory.getInstalledApps();
  }
}
