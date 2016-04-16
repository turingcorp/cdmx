#import "mcdmapitemiztapa.h"

@implementation mcdmapitemiztapa

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_iztapa", nil);
    self.asset = [[UIImage imageNamed:@"districts_iztapa"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end