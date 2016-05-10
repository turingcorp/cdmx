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
    self.spatial = [[gpollutiondist alloc] init:modeldistrict];
    self.makesstandby = NO;
    
    return self;
}

#pragma mark -
#pragma mark pollution item

-(void)turnon
{
    [super turnon];
    [self.spatial maxsize];
}

-(void)turnoff
{
    [super turnoff];
    [self.spatial minsize];
}

-(void)standby
{
    [super standby];
    [self.spatial minsize];
}

@end