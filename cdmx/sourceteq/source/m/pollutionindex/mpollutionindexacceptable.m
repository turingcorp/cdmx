#import "mpollutionindexacceptable.h"
#import "ecolor.h"

@implementation mpollutionindexacceptable

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_green];
    self.name = NSLocalizedString(@"mpollution_index_acceptable", nil);
    
    return self;
}

@end