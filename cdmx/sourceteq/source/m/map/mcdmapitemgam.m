#import "mcdmapitemgam.h"

@implementation mcdmapitemgam

-(instancetype)init
{
    self = [super init:@"gam"];
    self.name = NSLocalizedString(@"map_district_gam", nil);
    self.asset = [[UIImage imageNamed:@"districts_gam"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end