#import "mstationsannotation.h"

@implementation mstationsannotation

@synthesize title;
@synthesize coordinate;

-(instancetype)init:(NSString*)newtitle index:(mstationsreadingitemindex*)index coord:(CLLocationCoordinate2D)coord
{
    self = [super init];
    title = newtitle;
    coordinate = coord;
    self.index = index;
    
    return self;
}

@end
