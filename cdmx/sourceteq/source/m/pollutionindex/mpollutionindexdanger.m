#import "mpollutionindexdanger.h"
#import "ecolor.h"

@implementation mpollutionindexdanger

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_orange];
    self.name = NSLocalizedString(@"mpollution_index_danger", nil);
    self.info = NSLocalizedString(@"mpollution_index_danger_info", nil);
    
    return self;
}

@end