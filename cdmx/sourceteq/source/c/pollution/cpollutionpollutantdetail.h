#import <UIKit/UIKit.h>
#import "ccontroller.h"
#import "mpollutionpollutant.h"

@interface cpollutionpollutantdetail:ccontroller

-(instancetype)init:(mpollutionpollutant*)model;

@property(strong, nonatomic, readonly)mpollutionpollutant *model;

@end