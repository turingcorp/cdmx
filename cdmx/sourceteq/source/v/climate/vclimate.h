#import <UIKit/UIKit.h>
#import "cclimate.h"
#import "vspinner.h"

@interface vclimate:UIView

-(instancetype)init:(cclimate*)controller;

@property(weak, nonatomic, readonly)cclimate *controller;
@property(weak, nonatomic)vspinner *spinner;

@end