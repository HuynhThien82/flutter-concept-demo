import 'package:flutter_concept_demo/data/installed_apps/repository/installed_app_repository_impl.dart';
import 'package:flutter_concept_demo/domain/installed_apps/repository/installed_app_repository.dart';
import 'package:flutter_concept_demo/domain/installed_apps/usecase/get_installed_app.dart';
import 'package:flutter_concept_demo/presentation/installed_apps/bloc/installed_app_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  // Installed Apps
  getIt.registerLazySingleton<InstalledAppReposiory>(
      () => InstalledAppRepositoryImpl());
  getIt.registerFactory(() => GetInstalledApps(installedAppReposiory: getIt()));
  getIt.registerFactory(() => InstalledAppBloc(getInstalledApps: getIt()));
}
