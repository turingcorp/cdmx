#import "efont.h"

static NSString* const fontregularname =    @"AvenirNext-Regular";
static NSString* const fontboldname =       @"AvenirNext-DemiBold";
static NSString* const fontnumeric =        @"AvenirNextCondensed-Regular";

@implementation UIFont (efont)

+(instancetype)regularsize:(NSInteger)size
{
    return [UIFont fontWithName:fontregularname size:size];
}

+(instancetype)boldsize:(NSInteger)size
{
    return [UIFont fontWithName:fontboldname size:size];
}

+(instancetype)numericsize:(NSInteger)size
{
    return [UIFont fontWithName:fontnumeric size:size];
}

@end