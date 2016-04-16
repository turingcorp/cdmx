#import "mcdmapitemmag.h"

@implementation mcdmapitemmag

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_mag", nil);
    self.asset = @"districts_mag";
    
    return self;
}

@end