#import <UIKit/UIKit.h>
#import "vviewbar.h"

@interface vview:UIView

-(instancetype)init:(UIViewController*)controller;

@property(weak, nonatomic)vviewbar *bar;
@property(weak, nonatomic)UIViewController *controller;

@end