#import "mpollutiontextures.h"

@implementation mpollutiontextures

-(instancetype)init
{
    self = [super init];
    
    mpollutiontexturesitembenitojuarez *itembenitojuarez = [[mpollutiontexturesitembenitojuarez alloc] init];
    self.itembenitojuarez = itembenitojuarez;
    
    self.items = @[
                   itembenitojuarez
                   ];
    
    return self;
}

@end