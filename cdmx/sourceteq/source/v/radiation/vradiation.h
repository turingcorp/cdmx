#import <UIKit/UIKit.h>
#import "cradiation.h"
#import "vradiationreactor.h"
#import "mradiation.h"

@interface vradiation:UIView

-(instancetype)init:(cradiation*)controller;
-(void)radiationloaded:(mradiation*)model;

@property(weak, nonatomic)cradiation *controller;
@property(weak, nonatomic)vradiationreactor *reactor;

@end