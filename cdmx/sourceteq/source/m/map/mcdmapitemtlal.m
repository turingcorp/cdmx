#import "mcdmapitemtlal.h"

@implementation mcdmapitemtlal

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_tlal", nil);
    self.asset = [[UIImage imageNamed:@"districts_tlal"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end