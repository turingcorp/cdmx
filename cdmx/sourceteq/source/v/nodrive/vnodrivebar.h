#import <UIKit/UIKit.h>
#import "cnodrive.h"
#import "vmenubutton.h"

@interface vnodrivebar:UIView

-(instancetype)init:(cnodrive*)controller;

@property(weak, nonatomic)cnodrive *controller;
@property(weak, nonatomic)vmenubutton *menubutton;
@property(weak, nonatomic)UIImageView *icon;

@end