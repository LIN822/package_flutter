import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_package_platform_interface.dart';

/// An implementation of [FlutterPackagePlatform] that uses method channels.
class MethodChannelFlutterPackage extends FlutterPackagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_package');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
