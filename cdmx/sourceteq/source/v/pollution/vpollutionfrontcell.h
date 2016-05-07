#import <UIKit/UIKit.h>
#import "vpollutionfront.h"

@interface vpollutionfrontcell:UICollectionViewCell

-(void)config:(mpollutionreaditem*)model front:(vpollutionfront*)front;

@property(weak, nonatomic)vpollutionfront *front;
@property(weak, nonatomic)UILabel *label;
@property(weak, nonatomic)UIButton *buttonup;

@end