#import "efont.h"

static NSString* const fontregularname =    @"AvenirNext-Regular";
static NSString* const fontboldname =       @"AvenirNext-DemiBold";

@implementation UIFont (efont)

+(instancetype)regularsize:(NSInteger)size
{
    return [UIFont fontWithName:fontregularname size:size];
}

+(instancetype)boldsize:(NSInteger)size
{
    return [UIFont fontWithName:fontboldname size:size];
}

@end