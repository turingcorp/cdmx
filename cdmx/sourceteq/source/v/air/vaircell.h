#import <UIKit/UIKit.h>
#import "mstationsreadingitem.h"

@interface vaircell:UICollectionViewCell

-(void)config:(mstationsreadingitem*)model;

@property(weak, nonatomic)UILabel *title;
@property(weak, nonatomic)UIImageView *cloud;

@end