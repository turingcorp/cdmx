#import <UIKit/UIKit.h>
#import "cair.h"
#import "vmenubutton.h"
#import "vairbargeobutton.h"

@interface vairbar:UIView

-(instancetype)init:(cair*)controller;

@property(weak, nonatomic)cair *controller;
@property(weak, nonatomic)vmenubutton *menubutton;
@property(weak, nonatomic)vairbargeobutton *geobutton;
@property(weak, nonatomic)UIImageView *icon;

@end