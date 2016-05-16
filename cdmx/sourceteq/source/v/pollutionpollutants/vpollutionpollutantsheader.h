#import <UIKit/UIKit.h>
#import "mpollutionpollutant.h"

@interface vpollutionpollutantsheader:UICollectionReusableView

-(void)config:(mpollutionpollutant*)model;

@property(weak, nonatomic)UILabel *label;

@end