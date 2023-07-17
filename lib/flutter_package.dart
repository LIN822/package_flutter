// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'package:flutter/material.dart';

import 'flutter_package_platform_interface.dart';

part 'custom_dialog.dart';

class FlutterPackage {
  Future<String?> getPlatformVersion() {
    return FlutterPackagePlatform.instance.getPlatformVersion();
  }
}
