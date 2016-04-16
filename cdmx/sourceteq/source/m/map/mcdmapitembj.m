#import "mcdmapitembj.h"

@implementation mcdmapitembj

-(instancetype)init
{
    self = [super init:@"bej"];
    self.name = NSLocalizedString(@"map_district_bj", nil);
    self.asset = [[UIImage imageNamed:@"districts_bj"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end