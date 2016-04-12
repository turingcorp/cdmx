#import "mpages.h"
#import "mpagessectionstats.h"

@implementation mpages

-(instancetype)init
{
    self = [super init];
    self.sections = @[
                      [[mpagessectionstats alloc] init]
                      ];
    
    return self;
}

@end