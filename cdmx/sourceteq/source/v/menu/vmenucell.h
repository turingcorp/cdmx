#import <UIKit/UIKit.h>
#import "mpagesitem.h"

@interface vmenucell:UICollectionViewCell

-(void)config:(mpagesitem*)model;

@property(weak, nonatomic)mpagesitem *model;
@property(weak, nonatomic)UILabel *title;
@property(weak, nonatomic)UIImageView *icon;
@property(strong, nonatomic)NSMutableAttributedString *mut;

@end