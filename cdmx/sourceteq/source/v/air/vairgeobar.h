#import <UIKit/UIKit.h>
#import "cairgeo.h"

@interface vairgeobar:UIView

-(instancetype)init:(cairgeo*)controller;

@property(weak, nonatomic)cairgeo *controller;

@end