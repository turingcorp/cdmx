#import <UIKit/UIKit.h>
#import "acalldelegate.h"
#import "amanager.h"

@interface cnodrive:UIViewController<acalldelegate>

-(void)menu;
-(void)calendar;

@property(weak, nonatomic)amanager *apimanager;

@end