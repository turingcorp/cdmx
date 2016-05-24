#import "mpollutionfrontitemoptionrecommendation.h"
#import "cpollutionrecommendation.h"

@implementation mpollutionfrontitemoptionrecommendation

-(instancetype)init:(mpollutionindex*)index
{
    self = [super init];
    self.index = index;
    self.name = NSLocalizedString(@"vpollution_front_header_button_recommendation", nil);
    
    return self;
}

#pragma mark -
#pragma mark option

-(UIViewController*)controller
{
    cpollutionrecommendation *controller = [[cpollutionrecommendation alloc] init:self];
    
    return controller;
}

@end