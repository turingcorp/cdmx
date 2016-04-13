#import "mstationsreadingitemwind.h"

@implementation mstationsreadingitemwind

-(instancetype)init:(NSInteger)direction speed:(NSInteger)speed
{
    self = [super init];
    self.direction = direction;
    self.speed = speed;
    
    return self;
}

@end