#import "mcdmapitemcoyo.h"

@implementation mcdmapitemcoyo

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_coyo", nil);
    self.asset = @"districts_coyo";
    
    return self;
}

@end