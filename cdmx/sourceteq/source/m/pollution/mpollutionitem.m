#import "mpollutionitem.h"
#import "mpollutionitemdistrict.h"
#import "mpollutionitemdaily.h"
#import "mpollutionitemhourly.h"
#import "ecolor.h"

@implementation mpollutionitem

+(instancetype)district:(mdbdistrict*)modeldistrict
{
    mpollutionitemdistrict *model = [[mpollutionitemdistrict alloc] init:modeldistrict];
    model.name = modeldistrict.name;
    model.index = [mpollutionindex points:modeldistrict.pollution.integerValue];
    
    return model;
}

+(instancetype)pollutiondaily:(mdbpollutiondaily*)modelpollutiondaily
{
    mpollutionitemdaily *model = [[mpollutionitemdaily alloc] init:[mpollutionindex points:modelpollutiondaily.pollution.integerValue]];
    
    return model;
}

+(instancetype)pollutionhourly:(NSNumber*)hour pollution:(NSNumber*)pollution
{
    mpollutionitemhourly *model = [[mpollutionitemhourly alloc] init];
    model.name = [NSString stringWithFormat:<#(nonnull NSString *), ...#>];
    
    return model;
}

#pragma mark public

-(void)turnon
{
    self.spatial.color = [self.index.color asvector];
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