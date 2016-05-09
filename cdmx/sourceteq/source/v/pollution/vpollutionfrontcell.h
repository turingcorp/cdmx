#import <UIKit/UIKit.h>
#import "vpollutionfront.h"

@interface vpollutionfrontcell:UICollectionViewCell

-(void)config:(mpollutionitem*)model front:(vpollutionfront*)front;

@property(weak, nonatomic)vpollutionfront *front;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIButton *buttonup;

@end