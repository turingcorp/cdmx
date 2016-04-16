#import "mcdmapitemiztaca.h"

@implementation mcdmapitemiztaca

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_iztaca", nil);
    self.asset = [[UIImage imageNamed:@"districts_iztaca"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end