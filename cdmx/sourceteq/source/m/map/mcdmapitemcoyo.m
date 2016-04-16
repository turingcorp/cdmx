#import "mcdmapitemcoyo.h"

@implementation mcdmapitemcoyo

-(instancetype)init
{
    self = [super init:@"coy"];
    self.name = NSLocalizedString(@"map_district_coyo", nil);
    self.asset = [[UIImage imageNamed:@"districts_coyo"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end