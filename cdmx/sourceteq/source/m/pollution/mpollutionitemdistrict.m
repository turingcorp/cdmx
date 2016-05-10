#import "mpollutionitemdistrict.h"
#import "gpollutiondist.h"
#import "ecolor.h"

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
    self.spatial.color = [self.index.color asvector];
    [self.spatial movetotop];
}

-(void)turnoff
{
    self.spatial.color = [[UIColor background] asvector];
}

-(void)standby
{
    self.spatial.color = [self.index.color asvector];
}


@end