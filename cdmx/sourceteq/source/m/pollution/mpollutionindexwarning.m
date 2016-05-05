#import "mpollutionindexwarning.h"
#import "ecolor.h"

@implementation mpollutionindexwarning

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.points = points;
    self.color = [UIColor pollution_yellow];
    self.name = NSLocalizedString(@"mpollution_index_warning", nil);
    self.info = NSLocalizedString(@"mpollution_index_warning_info", nil);
    
    return self;
}

@end