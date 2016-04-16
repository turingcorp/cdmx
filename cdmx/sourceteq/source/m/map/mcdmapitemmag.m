#import "mcdmapitemmag.h"

@implementation mcdmapitemmag

-(instancetype)init
{
    self = [super init:@"mac"];
    self.name = NSLocalizedString(@"map_district_mag", nil);
    self.asset = [[UIImage imageNamed:@"districts_mag"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end