#import "mpollutionfrontitemoptionallpollutants.h"
#import "mpollutionfront.h"
#import "cpollutionpollutants.h"

@implementation mpollutionfrontitemoptionallpollutants

-(instancetype)init:(mpollutionfront*)model
{
    self = [super init];
    self.name = NSLocalizedString(@"vpollution_front_header_button_allpollutants", nil);
    
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