#import "mstationsitemlocation.h"

@implementation mstationsitemlocation

-(instancetype)init:(CGFloat)latitude lon:(CGFloat)longitude
{
    self = [super init];
    self.latitude = latitude;
    self.longitude = longitude;
    
    return self;
}

@end