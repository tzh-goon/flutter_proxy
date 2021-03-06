import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_proxy/flutter_proxy.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_proxy');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return <String, dynamic>{
        'host': '192.168.1.9',
        'port': 9909,
      };
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getProxySetting', () async {
    final setting = await FlutterProxy.proxySetting;
    expect(setting.enabled, true);
  });
}
