#import <UIKit/UIKit.h>
#import "mstationsnodriveplate.h"

@interface vnodriveplatescell:UICollectionViewCell

-(void)config:(mstationsnodriveplate*)model;

@property(weak, nonatomic)UILabel *label;

@end