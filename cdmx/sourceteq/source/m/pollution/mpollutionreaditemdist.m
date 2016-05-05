#import "mpollutionreaditemdist.h"

@implementation mpollutionreaditemdist

-(instancetype)init:(mpollutiondistitem*)dist index:(mpollutionindex*)index
{
    self = [super init:index];
    self.dist = dist;
    self.name = dist.name;
    
    return self;
}

@end