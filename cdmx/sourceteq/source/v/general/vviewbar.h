#import <UIKit/UIKit.h>

@interface vviewbar:UIView

-(instancetype)init:(UIViewController*)controller;

@property(weak, nonatomic)UIViewController *controller;
@property(weak, nonatomic)UIButton *buttonleft;

@end