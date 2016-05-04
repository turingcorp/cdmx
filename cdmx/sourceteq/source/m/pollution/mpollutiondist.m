#import "mpollutiondist.h"
#import "mpollutiondistitembenitojuarez.h"

@implementation mpollutiondist

-(instancetype)init
{
    self = [super init];
    
    mpollutiondistitembenitojuarez *itembenitojuarez = [[mpollutiondistitembenitojuarez alloc] init];
    self.itembenitojuarez = itembenitojuarez;
    
    self.items = @[
                   itembenitojuarez
                   ];
    
    return self;
}

@end