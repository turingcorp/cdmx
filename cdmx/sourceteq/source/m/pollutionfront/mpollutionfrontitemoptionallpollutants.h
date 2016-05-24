#import <Foundation/Foundation.h>
#import "mpollutionfrontitemoption.h"

@interface mpollutionfrontitemoptionallpollutants:mpollutionfrontitemoption

-(instancetype)init:(mpollutionfront*)model;

@property(strong, nonatomic, readonly)NSArray<mpollutionpollutant*> *pollutants;

@end