#import <UIKit/UIKit.h>
#import "cair.h"
#import "mcdmap.h"

@interface vairmap:UIView

-(instancetype)init:(cair*)controller;
-(void)refresh;
-(void)clean;

@property(strong, nonatomic)mcdmap *model;
@property(weak, nonatomic)cair *controller;
@property(weak, nonatomic)UIView *overview;

@end