#import "mpollutionitem.h"
#import "mpollutionitemdistrict.h"
#import "mpollutionitemdaily.h"
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
    mpollutionitemdaily *model = [[mpollutionitemdaily alloc] init];
    model.name = NSLocalizedString(@"mpollution_item_daily_summary", nil);
    model.index = [mpollutionindex points:modelpollutiondaily.pollution.integerValue];
    
    return model;
}

#pragma mark public

-(void)highlighted
{
    self.spatial.color = [self.index.color asvector];
}

-(void)regular
{
    self.spatial.color = [self.index.color asvector];
}

-(void)nothighlighted
{
    self.spatial.color = [[UIColor background] asvector];
}

@end