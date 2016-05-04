#import "mpollutiondist.h"
#import "mpollutiondistitembenitojuarez.h"
#import "mpollutiondistitemcoyoacan.h"

@implementation mpollutiondist

-(instancetype)init
{
    self = [super init];
    
    mpollutiondistitembenitojuarez *itembenitojuarez = [[mpollutiondistitembenitojuarez alloc] init];
    self.itembenitojuarez = itembenitojuarez;
    
    mpollutiondistitemcoyoacan *itemcoyoacan = [[mpollutiondistitemcoyoacan alloc] init];
    self.itemcoyoacan = itemcoyoacan;
    
    self.items = @[
                   itembenitojuarez,
                   itemcoyoacan
                   ];
    
    return self;
}

@end