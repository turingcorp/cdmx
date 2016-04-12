#import <UIKit/UIKit.h>
#import "mpagessection.h"

@interface vmenuheader:UICollectionReusableView

-(void)config:(mpagessection*)model;

@property(weak, nonatomic)UILabel *title;

@end