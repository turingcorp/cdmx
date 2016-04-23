#import <UIKit/UIKit.h>
#import "mstationsreadingitem.h"

@interface cairgeo:UIViewController<UIGestureRecognizerDelegate>

-(void)back;
-(void)centeruser;
-(void)selectitem:(mstationsreadingitem*)item;

@property(weak, nonatomic)id<UIGestureRecognizerDelegate> prevgesturedelegate;

@end