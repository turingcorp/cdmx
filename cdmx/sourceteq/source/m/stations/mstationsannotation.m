#import "mstationsannotation.h"

@implementation mstationsannotation

@synthesize title;
@synthesize coordinate;

-(instancetype)init:(NSString*)newtitle model:(mstationsreadingitem*)model coord:(CLLocationCoordinate2D)coord
{
    self = [super init];
    title = newtitle;
    coordinate = coord;
    self.model = model;
    
    return self;
}

@end
