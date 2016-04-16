#import "mcdmapitemtlal.h"

@implementation mcdmapitemtlal

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_tlal", nil);
    self.asset = @"districts_tlal";
    
    return self;
}

@end