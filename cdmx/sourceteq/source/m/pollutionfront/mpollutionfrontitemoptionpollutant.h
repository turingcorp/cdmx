#import <Foundation/Foundation.h>
#import "mpollutionfrontitemoption.h"

@interface mpollutionfrontitemoptionpollutant:mpollutionfrontitemoption

-(instancetype)init:(mpollutionpollutant*)pollutant;

@property(strong, nonatomic, readonly)NSArray<mpollutionpollutant*> *pollutants;

@end