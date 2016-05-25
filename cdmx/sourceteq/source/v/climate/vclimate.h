#import <UIKit/UIKit.h>
#import "cclimate.h"

@interface vclimate:UIView

-(instancetype)init:(cclimate*)controller;

@property(weak, nonatomic, readonly)cclimate *controller;

@end