#import "mpollutionitemdistrict.h"
#import "gpollutiondist.h"

@implementation mpollutionitemdistrict

-(instancetype)init:(mdbdistrict*)modeldistrict
{
    self = [super init];
    self.modeldistrict = modeldistrict;
    self.spatial = [[gpollutiondist alloc] init:modeldistrict.asset];
    
    return self;
}

@end