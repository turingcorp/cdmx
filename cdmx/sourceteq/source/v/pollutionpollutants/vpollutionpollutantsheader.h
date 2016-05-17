#import <UIKit/UIKit.h>
#import "mpollutionpollutant.h"

@interface vpollutionpollutantsheader:UICollectionReusableView

-(void)config:(mpollutionpollutant*)model;

@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UILabel *symbol;

@end