#import <UIKit/UIKit.h>
#import "mpagesitem.h"

@interface vmenucell:UICollectionViewCell

-(void)config:(mpagesitem*)model;

@property(weak, nonatomic)mpagesitem *model;

@end