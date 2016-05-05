#import "mpollutionindexdisaster.h"
#import "ecolor.h"

@implementation mpollutionindexdisaster

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_red];
    self.name = NSLocalizedString(@"mpollution_index_disaster", nil);
    
    return self;
}

@end