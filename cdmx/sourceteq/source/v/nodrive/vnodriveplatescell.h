#import <UIKit/UIKit.h>
#import "mstationsnodriveplate.h"

@interface vnodriveplatescell:UICollectionViewCell

-(void)config:(mstationsnodriveplate*)model number:(NSNumber*)number;

@property(weak, nonatomic)UILabel *label;

@end