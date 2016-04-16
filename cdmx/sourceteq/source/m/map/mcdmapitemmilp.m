#import "mcdmapitemmilp.h"

@implementation mcdmapitemmilp

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_milp", nil);
    self.asset = [[UIImage imageNamed:@"districts_milp"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end