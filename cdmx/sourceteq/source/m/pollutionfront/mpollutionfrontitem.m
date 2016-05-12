#import "mpollutionfrontitem.h"
#import "ecolor.h"

@interface mpollutionfrontitem ()

@property(strong, nonatomic, readwrite)mpollutionindex *index;
@property(strong, nonatomic, readwrite)gpollutiondist *spatial;
@property(copy, nonatomic, readwrite)NSString *name;

@end

@implementation mpollutionfrontitem

+(instancetype)district:(mdbdistrict*)district
{
    mpollutionfrontitem *model = [[mpollutionfrontitem alloc] init];
    model.name = district.name;
    model.index = [mpollutionindex points:district.pollution.integerValue];
    model.spatial = [[gpollutiondist alloc] init:district];
    
    return model;
}

+(instancetype)global:(NSInteger)pollution
{
    mpollutionfrontitem *model = [[mpollutionfrontitem alloc] init];
    model.name = NSLocalizedString(@"mpollution_front_global", nil);
    model.index = [mpollutionindex points:pollution];
    
    return model;
}

#pragma mark public

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