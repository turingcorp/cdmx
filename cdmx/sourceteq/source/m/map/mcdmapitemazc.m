#import "mcdmapitemazc.h"

@implementation mcdmapitemazc

-(instancetype)init
{
    self = [super init:@"azc"];
    self.name = NSLocalizedString(@"map_district_azc", nil);
    self.asset = [[UIImage imageNamed:@"districts_azc"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end