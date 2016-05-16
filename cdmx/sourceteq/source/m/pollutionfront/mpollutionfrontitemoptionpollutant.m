#import "mpollutionfrontitemoptionpollutant.h"

@implementation mpollutionfrontitemoptionpollutant

-(instancetype)init:(mpollutionpollutant*)pollutant
{
    self = [super init];
    self.name = [NSString stringWithFormat:NSLocalizedString(@"vpollution_front_header_button_pollutant", nil), pollutant.name];
    
    return self;
}

@end