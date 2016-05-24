#import "mpollutionfrontitemoptionpollutant.h"
#import "cpollutionpollutants.h"

@interface mpollutionfrontitemoptionpollutant ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionpollutant*> *pollutants;

@end

@implementation mpollutionfrontitemoptionpollutant

-(instancetype)init:(mpollutionpollutant*)pollutant
{
    self = [super init];
    self.name = [NSString stringWithFormat:NSLocalizedString(@"vpollution_front_header_button_pollutant", nil), pollutant.name];
    self.pollutants = @[pollutant];
    
    return self;
}

#pragma mark -
#pragma mark option

-(UIViewController*)controller
{
    cpollutionpollutants *controller = [[cpollutionpollutants alloc] init:self.pollutants];
    
    return controller;
}

@end