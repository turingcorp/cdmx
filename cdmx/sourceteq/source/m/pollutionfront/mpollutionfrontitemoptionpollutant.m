#import "mpollutionfrontitemoptionpollutant.h"
#import "cpollutionpollutantdetail.h"

@interface mpollutionfrontitemoptionpollutant ()

@property(weak, nonatomic, readwrite)mpollutionpollutant *pollutant;

@end

@implementation mpollutionfrontitemoptionpollutant

-(instancetype)init:(mpollutionpollutant*)pollutant
{
    self = [super init];
    self.name = [NSString stringWithFormat:NSLocalizedString(@"vpollution_front_header_button_pollutant", nil), pollutant.name];
    self.pollutant = pollutant;
    
    return self;
}

#pragma mark -
#pragma mark option

-(UIViewController*)controller
{
    cpollutionpollutantdetail *controller = [[cpollutionpollutantdetail alloc] init:self.pollutant];
    
    return controller;
}

@end