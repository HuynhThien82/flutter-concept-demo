import 'dart:typed_data';

import 'package:flutter/foundation.dart';

class InstalledApp {
  String appName;
  String packageName;
  Uint8List icon;

  InstalledApp({
    required this.appName,
    required this.packageName,
    required this.icon,
  });
}
