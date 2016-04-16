#import "mcdmapitembj.h"

@implementation mcdmapitembj

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_bj", nil);
    self.asset = @"districts_bj";
    
    return self;
}

@end