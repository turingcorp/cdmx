#import <UIKit/UIKit.h>
#import "vbutton.h"
#import "mpollutionitem.h"

@interface vpollutionfrontheadercurrent:vbutton

-(void)config:(mpollutionitem*)model;

@property(weak, nonatomic)UILabel *labeltitle;

@end