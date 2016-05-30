#import <Foundation/Foundation.h>
#import "mpollutionfrontitemoption.h"

@interface mpollutionfrontitemoptionpollutant:mpollutionfrontitemoption

-(instancetype)init:(mpollutionpollutant*)pollutant;

@property(weak, nonatomic, readonly)mpollutionpollutant *pollutant;

@end