#import <UIKit/UIKit.h>
#import "mradiationaboutitem.h"

@interface vradiationaboutcell:UICollectionViewCell

-(void)config:(mradiationaboutitem*)model;

@property(weak, nonatomic)UIImageView *circle;
@property(weak, nonatomic)UILabel *label;

@end