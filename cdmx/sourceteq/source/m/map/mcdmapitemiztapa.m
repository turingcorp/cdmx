#import "mcdmapitemiztapa.h"

@implementation mcdmapitemiztapa

-(instancetype)init
{
    self = [super init:@"izp"];
    self.name = NSLocalizedString(@"map_district_iztapa", nil);
    self.asset = [[UIImage imageNamed:@"districts_iztapa"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end