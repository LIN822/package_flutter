import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_package/flutter_package.dart';
import 'package:flutter_package/flutter_package_platform_interface.dart';
import 'package:flutter_package/flutter_package_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPackagePlatform
    with MockPlatformInterfaceMixin
    implements FlutterPackagePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPackagePlatform initialPlatform = FlutterPackagePlatform.instance;

  test('$MethodChannelFlutterPackage is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPackage>());
  });

  test('getPlatformVersion', () async {
    FlutterPackage flutterPackagePlugin = FlutterPackage();
    MockFlutterPackagePlatform fakePlatform = MockFlutterPackagePlatform();
    FlutterPackagePlatform.instance = fakePlatform;

    expect(await flutterPackagePlugin.getPlatformVersion(), '42');
  });
}
