#import <UIKit/UIKit.h>
#import "mnodrivetodaysection.h"

@interface vnodriveheader:UICollectionReusableView

-(void)config:(mnodrivetodaysection*)model;

@property(weak, nonatomic)UILabel *title;

@end