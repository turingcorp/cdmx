#import <UIKit/UIKit.h>

@interface ccdmx:UIViewController<UIGestureRecognizerDelegate>

-(void)back;
-(void)menu;

@property(weak, nonatomic)id<UIGestureRecognizerDelegate> prevgesturedelegate;

@end