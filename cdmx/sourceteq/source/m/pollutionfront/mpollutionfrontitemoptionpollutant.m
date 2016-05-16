#import "mpollutionfrontitemoptionpollutant.h"
#import "cpollutionpollutants.h"

@implementation mpollutionfrontitemoptionpollutant

-(instancetype)init:(mpollutionpollutant*)pollutant
{
    self = [super init];
    self.name = [NSString stringWithFormat:NSLocalizedString(@"vpollution_front_header_button_pollutant", nil), pollutant.name];
    
    return self;
}

#pragma mark -
#pragma mark option

-(UIViewController*)controller
{
    cpollutionpollutants *controller = [[cpollutionpollutants alloc] init];
    
    return controller;
}

@end