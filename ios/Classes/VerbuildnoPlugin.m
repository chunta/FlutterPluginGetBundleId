#import "VerbuildnoPlugin.h"
#import "Helper.h"

@implementation VerbuildnoPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  FlutterMethodChannel* channel = [FlutterMethodChannel
      methodChannelWithName:@"verbuildno"
            binaryMessenger:[registrar messenger]];
  VerbuildnoPlugin* instance = [[VerbuildnoPlugin alloc] init];
  [registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
  if ([@"getPlatformVersion" isEqualToString:call.method]) {
    result([@"iOS " stringByAppendingString:[[UIDevice currentDevice] systemVersion]]);
  } else if ([@"getBundleIdentifer" isEqualToString:call.method]) {
     result([[NSBundle mainBundle] bundleIdentifier]);
  } else if ([@"getNumberOfCore" isEqualToString:call.method]) {
    NSNumber* number = [[Helper new] numberOfCore];
    NSString* prefix = @"##";
    result([prefix stringByAppendingString:[number stringValue]]);
  } else {
    result(FlutterMethodNotImplemented);
  }
}

@end
