#import <UIKit/UIKit.h>
#import "cmenu.h"

@interface vmenu:UIView

-(instancetype)init:(cmenu*)controller;

@property(weak, nonatomic)cmenu *controller;

@end