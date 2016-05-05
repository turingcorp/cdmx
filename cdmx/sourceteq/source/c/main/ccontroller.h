#import <UIKit/UIKit.h>

@interface ccontroller:UIViewController<UIGestureRecognizerDelegate>

-(void)back;
-(void)menu;

@property(weak, nonatomic)id<UIGestureRecognizerDelegate> prevgesturedelegate;

@end