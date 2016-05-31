#import <UIKit/UIKit.h>
#import "mecobicimenuitem.h"

@interface vecobicimenucell:UICollectionViewCell

-(void)config:(mecobicimenuitem*)model;

@property(weak, nonatomic)UIImageView *icon;

@end