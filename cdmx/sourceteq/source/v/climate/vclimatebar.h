#import <UIKit/UIKit.h>
#import "cclimate.h"

@interface vclimatebar:UIView

-(instancetype)init:(cclimate*)controller;

@property(weak, nonatomic)cclimate *controller;

@end