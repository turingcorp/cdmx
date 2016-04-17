#import <UIKit/UIKit.h>
#import "cairgeo.h"
#import "vairgeomap.h"

@interface vairgeo:UIView

-(instancetype)init:(cairgeo*)controller;

@property(weak, nonatomic)cairgeo *controller;
@property(weak, nonatomic)vairgeomap *map;

@end