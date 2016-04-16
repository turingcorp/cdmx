#import "mcdmapitemtlahu.h"

@implementation mcdmapitemtlahu

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_tlahu", nil);
    self.asset = [[UIImage imageNamed:@"districts_tlahu"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end