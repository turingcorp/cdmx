#import <UIKit/UIKit.h>
#import "mpollutionpollutant.h"

@interface vpollutionpollutantscell:UICollectionViewCell

-(void)config:(mpollutionpollutant*)model;

@property(weak, nonatomic)UILabel *label;

@end