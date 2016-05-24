#import "mpollutionfrontitemoptionimeca.h"
#import "cpollutionimeca.h"

@implementation mpollutionfrontitemoptionimeca

-(instancetype)init
{
    self = [super init];
    self.name = NSLocalizedString(@"vpollution_front_header_button_imeca", nil);
    
    return self;
}

#pragma mark -
#pragma mark option

-(UIViewController*)controller
{
    cpollutionimeca *controller = [[cpollutionimeca alloc] init];
    
    return controller;
}

@end