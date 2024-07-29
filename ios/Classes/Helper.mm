#import "Helper.h"
#include "NativeLib.h"

@implementation Helper
-(NSNumber*) numberOfCore {
    int core = NativeLib().numberOfCore();
    return [NSNumber numberWithInt: core];
}
@end