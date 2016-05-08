#import "zqlresultsuccess.h"

@implementation zqlresultsuccess

-(instancetype)init
{
    self = [super init];
    self.success = YES;
    self.lastinsertid = 0;
    
    return self;
}

@end