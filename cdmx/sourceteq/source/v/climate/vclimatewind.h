#import <UIKit/UIKit.h>
#import "mclimatewind.h"

@interface vclimatewind:UIView

-(instancetype)init:(mclimatewind*)model;

@property(weak, nonatomic, readonly)mclimatewind *model;

@end