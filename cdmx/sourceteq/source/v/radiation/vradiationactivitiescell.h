#import <UIKit/UIKit.h>
#import "mradiationactivity.h"

@interface vradiationactivitiescell:UICollectionViewCell

-(void)config:(mradiationactivity*)model;

@property(weak, nonatomic)UILabel *title;

@end