#import "mpollutionfrontitemoption.h"
#import "mpollutionfrontitemoptionimeca.h"
#import "mpollutionfrontitemoptionrecommendation.h"
#import "mpollutionfrontitemoptionpollutant.h"
#import "mpollutionfrontitemoptionallpollutants.h"

@implementation mpollutionfrontitemoption

+(instancetype)imeca
{
    mpollutionfrontitemoptionimeca *option = [[mpollutionfrontitemoptionimeca alloc] init];
    
    return option;
}

+(instancetype)recommendation:(mpollutionindex*)index
{
    mpollutionfrontitemoptionrecommendation *option = [[mpollutionfrontitemoptionrecommendation alloc] init:index];
    
    return option;
}

+(instancetype)pollutant:(mpollutionpollutant*)pollutant
{
    mpollutionfrontitemoptionpollutant *option = [[mpollutionfrontitemoptionpollutant alloc] init:pollutant];
    
    return option;
}

+(instancetype)allpollutants:(mpollutionfront*)model
{
    mpollutionfrontitemoptionallpollutants *option = [[mpollutionfrontitemoptionallpollutants alloc] init:model];
    
    return option;
}

#pragma mark public

-(UIViewController*)controller
{
    return nil;
}

@end