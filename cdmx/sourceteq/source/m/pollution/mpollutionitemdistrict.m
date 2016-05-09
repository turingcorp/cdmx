#import "mpollutionitemdistrict.h"
#import "gpollutiondist.h"

@implementation mpollutionitemdistrict

#pragma mark -
#pragma mark pollution item

-(gspatial*)spatial
{
    gpollutiondist *spatial = [[gpollutiondist alloc] init:self.modeldistrict.asset];
    
    return spatial;
}

@end