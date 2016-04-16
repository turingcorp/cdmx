#import "mcdmapitemcuaji.h"

@implementation mcdmapitemcuaji

-(instancetype)init
{
    self = [super init:@""];
    self.name = NSLocalizedString(@"map_district_cuaji", nil);
    self.asset = @"districts_cuaji";
    
    return self;
}

@end