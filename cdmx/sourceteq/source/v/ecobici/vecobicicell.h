#import <UIKit/UIKit.h>
#import "vcollectioncell.h"
#import "mecobiciitem.h"

@interface vecobicicell:vcollectioncell

-(void)config:(mecobiciitem*)model;

@property(weak, nonatomic)UILabel *labelname;
@property(weak, nonatomic)UILabel *labelnumber;

@end