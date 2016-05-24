#import <UIKit/UIKit.h>
#import "ccontroller.h"
#import "mpollutionfrontitemoptionrecommendation.h"

@interface cpollutionrecommendation:ccontroller

-(instancetype)init:(mpollutionfrontitemoptionrecommendation*)model;

@property(weak, nonatomic)mpollutionfrontitemoptionrecommendation *model;

@end