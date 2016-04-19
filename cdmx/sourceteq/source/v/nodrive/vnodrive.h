#import <UIKit/UIKit.h>
#import "cnodrive.h"
#import "vnodrivebar.h"

@interface vnodrive:UIView

-(instancetype)init:(cnodrive*)controller;

@property(weak, nonatomic)cnodrive *controller;
@property(weak, nonatomic)vnodrivebar *bar;
@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;

@end