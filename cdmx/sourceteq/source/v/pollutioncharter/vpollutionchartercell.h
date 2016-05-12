#import <UIKit/UIKit.h>
#import "vcollectioncell.h"
#import "mpollutionchartitem.h"

@interface vpollutionchartercell:vcollectioncell

-(void)config:(mpollutionchartitem*)model;

@property(weak, nonatomic)UILabel *label;

@end