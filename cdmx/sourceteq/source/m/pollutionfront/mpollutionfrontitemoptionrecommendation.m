#import "mpollutionfrontitemoptionrecommendation.h"

@implementation mpollutionfrontitemoptionrecommendation

-(instancetype)init:(mpollutionindex*)index
{
    self = [super init];
    self.name = NSLocalizedString(@"vpollution_front_header_button_recommendation", nil);
    
    return self;
}

#pragma mark -
#pragma mark option

-(UIViewController*)controller
{
    UIViewController *controller = [[UIViewController alloc] init];
    
    return controller;
}

@end