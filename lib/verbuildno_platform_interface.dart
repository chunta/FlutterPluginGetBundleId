import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'verbuildno_method_channel.dart';

abstract class VerbuildnoPlatform extends PlatformInterface {
  /// Constructs a VerbuildnoPlatform.
  VerbuildnoPlatform() : super(token: _token);

  static final Object _token = Object();

  static VerbuildnoPlatform _instance = MethodChannelVerbuildno();

  /// The default instance of [VerbuildnoPlatform] to use.
  ///
  /// Defaults to [MethodChannelVerbuildno].
  static VerbuildnoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [VerbuildnoPlatform] when
  /// they register themselves.
  static set instance(VerbuildnoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    return _instance.getPlatformVersion();
  }

  Future<String?> getBundleIdentifer() {
    return _instance.getBundleIdentifer();
  }
}
