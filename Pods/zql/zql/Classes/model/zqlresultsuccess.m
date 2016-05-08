#import "zqlresultsuccess.h"

@implementation zqlresultsuccess

-(instancetype)init:(BOOL)moresteps
{
    self = [super init];
    self.success = YES;
    self.moresteps = moresteps;
    self.lastinsertid = 0;
    
    return self;
}

@end