#import <UIKit/UIKit.h>
#import "cairdetail.h"

@interface vairdetailheader:UIView

-(instancetype)init:(cairdetail*)controller;

@property(weak, nonatomic)cairdetail *controller;
@property(weak, nonatomic)UIImageView *rosewind;
@property(weak, nonatomic)UIImageView *rosewindpointer;

@end