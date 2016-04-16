#import "mcdmapitemmh.h"

@implementation mcdmapitemmh

-(instancetype)init
{
    self = [super init:@"mih"];
    self.name = NSLocalizedString(@"map_district_mh", nil);
    self.asset = [[UIImage imageNamed:@"districts_mh"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end