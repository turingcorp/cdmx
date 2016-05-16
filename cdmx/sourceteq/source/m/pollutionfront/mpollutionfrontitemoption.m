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
    mpollutionfrontitemoptionrecommendation *option = [[mpollutionfrontitemoptionrecommendation alloc] init];
    
    return option;
}

+(instancetype)pollutant:(mpollutionpollutant*)pollutant
{
    mpollutionfrontitemoptionpollutant *option = [[mpollutionfrontitemoptionpollutant alloc] init];
    
    return option;
}

+(instancetype)allpollutants
{
    mpollutionfrontitemoptionallpollutants *option = [[mpollutionfrontitemoptionallpollutants alloc] init];
    
    return option;
}

@end