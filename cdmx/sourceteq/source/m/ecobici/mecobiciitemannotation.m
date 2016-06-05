#import "mecobiciitemannotation.h"

@implementation mecobiciitemannotation

@synthesize coordinate;

-(instancetype)init:(CGFloat)lat lon:(CGFloat)lon
{
    self = [super init];
    coordinate = CLLocationCoordinate2DMake(lat, lon);
    
    return self;
}

@end