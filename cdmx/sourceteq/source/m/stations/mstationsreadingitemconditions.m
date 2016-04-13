#import "mstationsreadingitemconditions.h"

@implementation mstationsreadingitemconditions

-(instancetype)init:(CGFloat)temperature humidity:(CGFloat)humidity
{
    self = [super init];
    self.temperature = temperature;
    self.humidity = humidity;
    
    return self;
}

@end