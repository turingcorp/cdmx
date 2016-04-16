#import "mcdmapitemiztapa.h"

@implementation mcdmapitemiztapa

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_iztapa", nil);
    self.asset = @"districts_iztapa";
    
    return self;
}

@end