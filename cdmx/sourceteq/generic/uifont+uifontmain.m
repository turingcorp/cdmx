#import "uifont+uifontmain.h"

static NSString* const fontregularname =    @"AvenirNext-Regular";
static NSString* const fontboldname =       @"AvenirNext-DemiBold";

@implementation UIFont (uifontmain)

+(instancetype)regularsize:(CGFloat)size
{
    return [UIFont fontWithName:fontregularname size:size];
}

+(instancetype)boldsize:(CGFloat)size
{
    return [UIFont fontWithName:fontboldname size:size];
}

@end