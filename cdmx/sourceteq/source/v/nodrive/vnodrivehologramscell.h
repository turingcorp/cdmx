#import <UIKit/UIKit.h>
#import "mstationsnodrivehologram.h"

@interface vnodrivehologramscell:UICollectionViewCell

-(void)config:(mstationsnodrivehologram*)model;

@property(weak, nonatomic)UILabel *label;

@end