#import <UIKit/UIKit.h>
#import "cairgeo.h"

@interface vairgeobar:UIView

-(instancetype)init:(cairgeo*)controller;
-(void)showuser;

@property(weak, nonatomic)cairgeo *controller;

@end