#import <UIKit/UIKit.h>
#import "mradiationaboutsection.h"

@interface vradiationaboutheader:UICollectionReusableView

-(void)config:(mradiationaboutsection*)model;

@property(weak, nonatomic)UILabel *labelname;
@property(weak, nonatomic)UILabel *labelinfo;
@property(weak, nonatomic)UIView *border;

@end