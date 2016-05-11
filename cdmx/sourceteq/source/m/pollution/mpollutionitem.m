#import "mpollutionitem.h"
#import "mpollutionitemdistrict.h"
#import "mpollutionitemglobal.h"
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

+(instancetype)pollutionglobal:(NSNumber*)pollution
{
    mpollutionitemglobal *model = [[mpollutionitemglobal alloc] init:[mpollutionindex points:pollution.integerValue]];
    
    return model;
}

+(instancetype)pollutiondaily:(mdbpollutiondaily*)modelpollutiondaily
{
    mpollutionitemdaily *model = [[mpollutionitemdaily alloc] init:[mpollutionindex points:modelpollutiondaily.pollution.integerValue] date:modelpollutiondaily.date];
    
    return model;
}

+(instancetype)pollutionhourly:(NSNumber*)hour pollution:(NSNumber*)pollution
{
    mpollutionitemhourly *model = [[mpollutionitemhourly alloc] init:[mpollutionindex points:pollution.integerValue] hour:hour];
    
    return model;
}

#pragma mark public

-(void)turnon
{
}

-(void)turnoff
{
}

-(void)standby
{
}

@end