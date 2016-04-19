#import <UIKit/UIKit.h>
#import "csettings.h"

@interface vsettingsbar:UIView

-(instancetype)init:(csettings*)controller;

@property(weak, nonatomic)csettings *controller;

@end