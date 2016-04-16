#import "mcdmapitemalv.h"

@implementation mcdmapitemalv

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_alv", nil);
    self.asset = [[UIImage imageNamed:@"districts_alv"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end