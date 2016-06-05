#import <UIKit/UIKit.h>
#import "vview.h"
#import "vspinner.h"

@interface vadminmetro:vview

-(void)modelcreated;

@property(weak, nonatomic)vspinner *spinner;
@property(weak, nonatomic)UIButton *buttonexport;

@end