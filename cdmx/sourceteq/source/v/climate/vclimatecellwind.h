#import <UIKit/UIKit.h>
#import "vclimatecell.h"
#import "vclimatewind.h"

@interface vclimatecellwind:vclimatecell

@property(weak, nonatomic)vclimatewind *wind;
@property(weak, nonatomic)UILabel *label;

@end