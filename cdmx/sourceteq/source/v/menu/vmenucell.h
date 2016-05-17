#import <UIKit/UIKit.h>
#import "vcollectioncell.h"
#import "mmenusectionitem.h"

@interface vmenucell:vcollectioncell

-(void)config:(mmenusectionitem*)model;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIImageView *icon;

@end