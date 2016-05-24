#import <UIKit/UIKit.h>
#import "cradiation.h"

@interface vradiationbar:UIView

-(instancetype)init:(cradiation*)controller;

@property(weak, nonatomic)cradiation *controller;

@end