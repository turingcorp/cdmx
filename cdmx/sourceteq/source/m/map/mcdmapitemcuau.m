#import "mcdmapitemcuau.h"

@implementation mcdmapitemcuau

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_cuau", nil);
    self.asset = @"districts_cuau";
    
    return self;
}

@end