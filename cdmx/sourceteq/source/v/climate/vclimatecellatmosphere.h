#import <UIKit/UIKit.h>
#import "vclimatecell.h"

@interface vclimatecellatmosphere:vclimatecell

@property(weak, nonatomic)UILabel *humiditylabel;
@property(weak, nonatomic)UIImageView *risingimage;
@property(weak, nonatomic)NSLayoutConstraint *layouthumidityleft;
@property(weak, nonatomic)NSLayoutConstraint *layoutrisingleft;

@end