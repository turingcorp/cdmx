#import <UIKit/UIKit.h>
#import "mpollutionmenuitem.h"

@interface vpollutionmenucell:UICollectionViewCell

-(void)config:(mpollutionmenuitem*)model;

@property(weak, nonatomic)UIImageView *icon;

@end