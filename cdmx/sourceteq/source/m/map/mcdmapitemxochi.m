#import "mcdmapitemxochi.h"

@implementation mcdmapitemxochi

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_xochi", nil);
    self.asset = [[UIImage imageNamed:@"districts_xochi"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end