#import "mpollutionitem.h"
#import "mpollutionitemdistrict.h"
#import "mpollutionitemdaily.h"

@implementation mpollutionitem

+(instancetype)district:(mdbdistrict*)modeldistrict
{
    mpollutionitemdistrict *model = [[mpollutionitemdistrict alloc] init];
    model.name = modeldistrict.name;
    model.index = [mpollutionindex points:modeldistrict.pollution.integerValue];
    
    return model;
}

+(instancetype)pollutiondaily:(mdbpollutiondaily*)modelpollutiondaily
{
    
}

@end