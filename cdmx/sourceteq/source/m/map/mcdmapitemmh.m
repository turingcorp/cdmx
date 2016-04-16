#import "mcdmapitemmh.h"

@implementation mcdmapitemmh

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_mh", nil);
    self.asset = @"districts_mh";
    
    return self;
}

@end