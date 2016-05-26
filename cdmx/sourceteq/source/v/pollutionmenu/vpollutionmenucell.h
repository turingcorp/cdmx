#import <UIKit/UIKit.h>
#import "mpollutionmenuitem.h"

@interface vpollutionmenucell:UICollectionViewCell

-(void)config:(mpollutionmenuitem*)model;

@property(weak, nonatomic)UIImageView *icon;
@property(weak, nonatomic)UIView *selector;

@end