#import "mclimate.h"

static CGFloat const milestokmratio = 1.60934;

@implementation mclimate

+(CGFloat)celsiusfrom:(CGFloat)fahrenheit
{
    return (fahrenheit - 32) * 5 / 9;
}

+(CGFloat)kilometersfrom:(CGFloat)miles
{
    return miles * milestokmratio;
}

-(instancetype)init:(NSDictionary*)dictionary
{
    self = [super init];
    
    return self;
}

@end