#import <UIKit/UIKit.h>
#import "vcollectioncell.h"
#import "mpollutionfrontitemoption.h"

@interface vpollutionfrontheadercell:vcollectioncell

-(void)config:(mpollutionfrontitemoption*)option;

@property(weak, nonatomic)UILabel *label;

@end