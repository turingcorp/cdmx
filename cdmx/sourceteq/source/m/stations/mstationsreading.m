#import "mstationsreading.h"

@implementation mstationsreading

-(instancetype)init
{
    self = [super init];
    
    return self;
}

#pragma mark public

-(void)sort
{
    self.items = [self.items sortedArrayUsingComparator:^NSComparisonResult(mstationsreadingitem *obj1, mstationsreadingitem *obj2)
                  {
                      return [obj1.name compare:obj2.name];
                  }];
}

@end