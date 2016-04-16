#import "mcdmapitemven.h"

@implementation mcdmapitemven

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_ven", nil);
    self.asset = [[UIImage imageNamed:@"districts_ven"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end