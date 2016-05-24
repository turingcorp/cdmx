#import <UIKit/UIKit.h>
#import "mradiationprecaution.h"

@interface vradiationprecautionscell:UICollectionViewCell

-(void)config:(mradiationprecaution*)model;

@property(weak, nonatomic)UIImageView *image;
@property(weak, nonatomic)UILabel *title;
@property(weak, nonatomic)UILabel *level;

@end