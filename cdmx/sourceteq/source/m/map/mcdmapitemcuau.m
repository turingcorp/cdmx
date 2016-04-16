#import "mcdmapitemcuau.h"

@implementation mcdmapitemcuau

-(instancetype)init
{
    self = [super init:@"cuh"];
    self.name = NSLocalizedString(@"map_district_cuau", nil);
    self.asset = [[UIImage imageNamed:@"districts_cuau"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end