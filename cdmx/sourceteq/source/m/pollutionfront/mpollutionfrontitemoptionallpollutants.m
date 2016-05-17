#import "mpollutionfrontitemoptionallpollutants.h"
#import "mpollutionfront.h"
#import "cpollutionpollutants.h"

@interface mpollutionfrontitemoptionallpollutants ()

@property(strong, nonatomic, readwrite)NSArray<mpollutionpollutant*> *pollutants;

@end

@implementation mpollutionfrontitemoptionallpollutants

-(instancetype)init:(mpollutionfront*)model
{
    self = [super init];
    self.name = NSLocalizedString(@"vpollution_front_header_button_allpollutants", nil);
    
    NSMutableArray<NSNumber*> *pollids = [NSMutableArray array];
    NSMutableArray<mpollutionpollutant*> *pollutants = [NSMutableArray array];
    
    for(mpollutionfrontitem *item in model.items)
    {
        if(item.pollutant)
        {
            NSNumber *serverid = item.pollutant.serverid;
            
            if(![pollids containsObject:serverid])
            {
                mpollutionpollutant *pollutant = [mpollutionpollutant server:serverid];
                
                [pollids addObject:serverid];
                [pollutants addObject:pollutant];
            }
        }
    }
    
    self.pollutants = pollutants;
    
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