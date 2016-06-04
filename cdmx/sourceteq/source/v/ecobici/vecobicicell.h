#import <UIKit/UIKit.h>
#import "vcollectioncell.h"
#import "mecobiciitem.h"

@interface vecobicicell:vcollectioncell

-(void)config:(mecobiciitem*)model;

@property(weak, nonatomic)UIImageView *circle;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UILabel *number;

@end