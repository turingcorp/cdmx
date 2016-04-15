#import <UIKit/UIKit.h>

@interface vaircellmain:UICollectionViewCell

-(void)config;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UILabel *labeltemp;
@property(weak, nonatomic)UILabel *labelhumidity;
@property(weak, nonatomic)UILabel *labeluvindex;
@property(weak, nonatomic)NSLayoutConstraint *layoutlabelheight;

@end