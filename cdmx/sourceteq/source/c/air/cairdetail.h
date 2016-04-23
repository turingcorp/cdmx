#import <UIKit/UIKit.h>
#import "mstationsreadingitem.h"

@interface cairdetail:UIViewController<UIGestureRecognizerDelegate>

-(instancetype)init:(mstationsreadingitem*)model;
-(void)back;

@property(weak, nonatomic)mstationsreadingitem *model;
@property(weak, nonatomic)id<UIGestureRecognizerDelegate> prevgesturedelegate;

@end