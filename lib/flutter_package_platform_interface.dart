import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_package_method_channel.dart';

abstract class FlutterPackagePlatform extends PlatformInterface {
  /// Constructs a FlutterPackagePlatform.
  FlutterPackagePlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPackagePlatform _instance = MethodChannelFlutterPackage();

  /// The default instance of [FlutterPackagePlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPackage].
  static FlutterPackagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPackagePlatform] when
  /// they register themselves.
  static set instance(FlutterPackagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
