#import <UIKit/UIKit.h>
#import "ccontroller.h"
#import "mpollutionpollutant.h"

@interface cpollutionpollutants:ccontroller;

-(instancetype)init:(NSArray<mpollutionpollutant*>*)items;

@property(strong, nonatomic, readonly)NSArray<mpollutionpollutant*> *items;

@end