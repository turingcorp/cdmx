#import <UIKit/UIKit.h>
#import "cradiation.h"
#import "vradiationreactor.h"

@interface vradiation:UIView

-(instancetype)init:(cradiation*)controller;

@property(weak, nonatomic)cradiation *controller;
@property(weak, nonatomic)vradiationreactor *reactor;

@end