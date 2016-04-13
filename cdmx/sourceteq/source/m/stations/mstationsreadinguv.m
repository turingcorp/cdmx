#import "mstationsreadinguv.h"

@implementation mstationsreadinguv

-(instancetype)init:(NSInteger)index title:(NSString*)title descr:(NSString*)descr
{
    self = [super init];
    self.index = [mstationsreadinguvindex indexwithnumber:index];
    self.title = title;
    self.descr = descr;
    
    return self;
}

@end