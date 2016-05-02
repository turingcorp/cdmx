#import "mnotificationglkdraw.h"

@implementation mnotificationglkdraw

-(instancetype)init:(GLKBaseEffect*)baseeffect
{
    self = [super init];
    self.baseeffect = baseeffect;
    
    return self;
}

@end