#import "mstationsreadingitemindexnodata.h"

@implementation mstationsreadingitemindexnodata

-(instancetype)init:(NSInteger)points
{
    self = [super init:points];
    self.color = [UIColor pollution_gray];
    
    return self;
}

@end