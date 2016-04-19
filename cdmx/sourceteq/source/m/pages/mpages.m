#import "mpages.h"
#import "mpagessectionstats.h"
#import "mpagessectioncars.h"
#import "mpagessectionapp.h"

@implementation mpages

-(instancetype)init
{
    self = [super init];
    self.sections = @[
                      [[mpagessectionstats alloc] init],
                      [[mpagessectioncars alloc] init],
                      [[mpagessectionapp alloc] init]
                      ];
    
    return self;
}

@end