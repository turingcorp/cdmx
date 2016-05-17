#import <UIKit/UIKit.h>
#import "mmenusection.h"

@interface vmenuheader:UICollectionReusableView

-(void)config:(mmenusection*)model;

@property(weak, nonatomic)UILabel *label;

@end