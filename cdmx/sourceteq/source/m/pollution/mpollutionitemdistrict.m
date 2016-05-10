#import "mpollutionitemdistrict.h"
#import "gpollutiondist.h"

@interface mpollutionitemdistrict ()

@property(strong, nonatomic)gpollutiondist *spatial;

@end

@implementation mpollutionitemdistrict

@dynamic spatial;

-(instancetype)init:(mdbdistrict*)modeldistrict
{
    self = [super init];
    self.modeldistrict = modeldistrict;
    self.spatial = [[gpollutiondist alloc] init:modeldistrict.asset];
    
    return self;
}

#pragma mark -
#pragma mark pollution item

-(void)highlighted
{
    [super highlighted];
}

-(void)nothighlighted
{
    [super nothighlighted];
}

@end