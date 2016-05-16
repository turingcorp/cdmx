#import "mpollutionindexnodata.h"
#import "ecolor.h"

@implementation mpollutionindexnodata

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_gray];
    self.name = NSLocalizedString(@"mpollution_index_nodata", nil);
    
    return self;
}

@end