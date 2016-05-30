#import <UIKit/UIKit.h>
#import "vcollectioncell.h"
#import "mpollutionpollutant.h"

@interface vpollutionpollutantscell:vcollectioncell

-(void)config:(mpollutionpollutant*)model;

@property(weak, nonatomic)UILabel *label;

@end