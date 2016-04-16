#import "mcdmapitemiztaca.h"

@implementation mcdmapitemiztaca

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_iztaca", nil);
    self.asset = @"districts_iztaca";
    
    return self;
}

@end