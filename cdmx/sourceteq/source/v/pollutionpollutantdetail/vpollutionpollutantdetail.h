#import <Foundation/Foundation.h>
#import "cpollutionpollutantdetail.h"
#import "vpollutionpollutantdetailbar.h"

@interface vpollutionpollutantdetail:UIView<UIScrollViewDelegate>

-(instancetype)init:(cpollutionpollutantdetail*)controller;
-(void)viewappear;

@property(weak, nonatomic)vpollutionpollutantdetailbar *bar;
@property(weak, nonatomic)cpollutionpollutantdetail *controller;
@property(weak, nonatomic)UIScrollView *scroll;
@property(weak, nonatomic)NSLayoutConstraint *layoutbarheight;

@end