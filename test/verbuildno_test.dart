import 'package:flutter_test/flutter_test.dart';
import 'package:verbuildno/verbuildno.dart';
import 'package:verbuildno/verbuildno_platform_interface.dart';
import 'package:verbuildno/verbuildno_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVerbuildnoPlatform
    with MockPlatformInterfaceMixin
    implements VerbuildnoPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VerbuildnoPlatform initialPlatform = VerbuildnoPlatform.instance;

  test('$MethodChannelVerbuildno is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelVerbuildno>());
  });

  test('getPlatformVersion', () async {
    Verbuildno verbuildnoPlugin = Verbuildno();
    MockVerbuildnoPlatform fakePlatform = MockVerbuildnoPlatform();
    VerbuildnoPlatform.instance = fakePlatform;

    expect(await verbuildnoPlugin.getPlatformVersion(), '42');
  });
}
