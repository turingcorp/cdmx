#import "mstationsreadingitemindexnodata.h"

@implementation mstationsreadingitemindexnodata

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.color = [UIColor pollution_gray];
    self.name = NSLocalizedString(@"air_index_nodata", nil);
    
    return self;
}

@end