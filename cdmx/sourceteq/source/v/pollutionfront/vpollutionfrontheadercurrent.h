#import <UIKit/UIKit.h>
#import "vbutton.h"
#import "mpollutionfrontitem.h"

@interface vpollutionfrontheadercurrent:vbutton

-(void)config:(mpollutionfrontitem*)model;

@property(weak, nonatomic)UILabel *labeltitle;

@end