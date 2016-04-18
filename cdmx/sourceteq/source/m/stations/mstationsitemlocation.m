#import "mstationsitemlocation.h"

@implementation mstationsitemlocation

-(instancetype)init:(CGFloat)latitude lon:(CGFloat)longitude
{
    self = [super init];
    self.latitude = latitude;
    self.longitude = longitude;
    
    return self;
}

#pragma mark public

-(CLLocationCoordinate2D)coordinates
{
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(self.latitude, self.longitude);
    
    return coords;
}

@end