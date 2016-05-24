#import <UIKit/UIKit.h>
#import "mradiationaboutsection.h"

@interface vradiationaboutheader:UICollectionReusableView

-(void)config:(mradiationaboutsection*)model;

@property(strong, nonatomic)NSDictionary *labelattributes;
@property(weak, nonatomic)NSLayoutConstraint *layoutlabelinfoheight;
@property(weak, nonatomic)UILabel *labelname;
@property(weak, nonatomic)UILabel *labelinfo;

@end