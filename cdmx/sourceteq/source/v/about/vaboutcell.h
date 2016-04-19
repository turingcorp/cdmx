#import <UIKit/UIKit.h>
#import "maboutitem.h"

@interface vaboutcell:UICollectionViewCell

-(void)config:(maboutitem*)model;

@property(weak, nonatomic)UILabel *label;

@end