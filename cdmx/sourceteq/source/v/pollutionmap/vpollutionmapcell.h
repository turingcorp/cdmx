#import <UIKit/UIKit.h>
#import "vcollectioncell.h"
#import "mpollutionmapitem.h"

@interface vpollutionmapcell:vcollectioncell

-(void)config:(mpollutionmapitem*)model;

@property(weak, nonatomic)UILabel *label;

@end