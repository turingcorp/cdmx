#import <UIKit/UIKit.h>
#import "vbutton.h"
#import "mpollutionreaditem.h"

@interface vpollutionfrontheadercurrent:vbutton

-(void)config:(mpollutionreaditem*)model;

@property(weak, nonatomic)UILabel *labeltitle;

@end