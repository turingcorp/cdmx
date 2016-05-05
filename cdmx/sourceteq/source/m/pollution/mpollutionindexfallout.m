#import "mpollutionindexfallout.h"
#import "ecolor.h"

@implementation mpollutionindexfallout

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_violet];
    self.name = NSLocalizedString(@"mpollution_index_fallout", nil);
    self.info = NSLocalizedString(@"mpollution_index_fallout_info", nil);
    
    return self;
}

@end