import 'package:flutter/material.dart';
import 'package:flutter_concept_demo/domain/installed_apps/model/installed_app.dart';
import 'package:flutter_concept_demo/presentation/installed_apps/bloc/installed_app_bloc.dart';

class InstalledAppPage extends StatelessWidget {
  static const route = "/installed-app";
  final InstalledAppBloc bloc;

  const InstalledAppPage({required this.bloc});

  @override
  Widget build(BuildContext context) {
    bloc.fetchInstalledApps();
    return Scaffold(
        appBar: AppBar(
          title: const Text("Platform Channel demo"),
        ),
        body: StreamBuilder(
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var data = snapshot.data as List<InstalledApp>;
              return ListView.builder(itemBuilder: ((context, index) {
                return Card(
                  child: Row(children: [
                    Image.memory(data[index].icon),
                    Text(data[index].appName),
                  ]),
                );
              }));
            } else {
              return Container();
            }
          },
          stream: bloc.getInstalledApps,
        ));
  }
}
