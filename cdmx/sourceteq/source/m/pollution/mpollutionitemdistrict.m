#import "mpollutionitemdistrict.h"
#import "gpollutiondist.h"

@implementation mpollutionitemdistrict

-(instancetype)init
{
    self = [super init];
    self.spatial = [[gpollutiondist alloc] init:self.modeldistrict.asset];
    
    return self;
}

@end