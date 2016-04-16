#import "mcdmapitemgam.h"

@implementation mcdmapitemgam

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_gam", nil);
    self.asset = @"districts_gam";
    
    return self;
}

@end