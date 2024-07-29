import 'verbuildno_platform_interface.dart';

class Verbuildno {
  Future<String?> getPlatformVersion() {
    return VerbuildnoPlatform.instance.getPlatformVersion();
  }

  Future<String?> getBundleIdentifer() {
    return VerbuildnoPlatform.instance.getBundleIdentifer();
  }

  Future<String?> getNumberOfCore() {
    return VerbuildnoPlatform.instance.getNumberOfCore();
  }
}
