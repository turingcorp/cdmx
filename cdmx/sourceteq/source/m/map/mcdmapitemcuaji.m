#import "mcdmapitemcuaji.h"

@implementation mcdmapitemcuaji

-(instancetype)init
{
    self = [super init:@"cua"];
    self.name = NSLocalizedString(@"map_district_cuaji", nil);
    self.asset = [[UIImage imageNamed:@"districts_cuaji"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    
    return self;
}

@end