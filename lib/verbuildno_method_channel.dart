import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'verbuildno_platform_interface.dart';

/// An implementation of [VerbuildnoPlatform] that uses method channels.
class MethodChannelVerbuildno extends VerbuildnoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('verbuildno');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<String?> getBundleIdentifer() async {
    final bundleIdentifer = await methodChannel.invokeMethod<String>('getBundleIdentifer');
    return bundleIdentifer;
  }
}
