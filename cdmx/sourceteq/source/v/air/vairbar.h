#import <UIKit/UIKit.h>
#import "cair.h"
#import "vmenubutton.h"

@interface vairbar:UIView

-(instancetype)init:(cair*)controller;

@property(weak, nonatomic)cair *controller;
@property(weak, nonatomic)vmenubutton *menubutton;
@property(weak, nonatomic)UIImageView *icon;

@end