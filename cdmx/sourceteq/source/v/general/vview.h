#import <UIKit/UIKit.h>
#import "vviewbar.h"

@interface vview:UIView

-(instancetype)init:(ccontroller*)controller;
-(vviewbar*)loadbar;

@property(weak, nonatomic)vviewbar *bar;
@property(weak, nonatomic)ccontroller *controller;

@end