#import "mabout.h"
#import "maboutitemreview.h"
#import "maboutitemshare.h"

@implementation mabout

-(instancetype)init
{
    self = [super init];
    self.items = @[
                   [[maboutitemreview alloc] init],
                   [[maboutitemshare alloc] init]
                   ];
    
    return self;
}

@end