#import <UIKit/UIKit.h>
#import "csettings.h"

@interface vaboutbar:UIView

-(instancetype)init:(csettings*)controller;

@property(weak, nonatomic)csettings *controller;

@end