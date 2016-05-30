#import <UIKit/UIKit.h>
#import "cpollutionpollutantdetail.h"

@interface vpollutionpollutantdetailbar:UIView

-(instancetype)init:(cpollutionpollutantdetail*)controller;

@property(weak, nonatomic)cpollutionpollutantdetail *controller;
@property(weak, nonatomic)UILabel *title;

@end