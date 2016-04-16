#import <UIKit/UIKit.h>
#import "cair.h"

@interface vairmap:UIView

-(instancetype)init:(cair*)controller;
-(void)refresh;
-(void)clean;

@property(weak, nonatomic)cair *controller;
@property(weak, nonatomic)UIView *overview;

@end