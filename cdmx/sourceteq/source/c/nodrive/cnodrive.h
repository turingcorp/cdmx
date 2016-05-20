#import <UIKit/UIKit.h>
#import "acalldelegate.h"
#import "amanager.h"

@interface cnodrive:UIViewController<acalldelegate>

-(void)menu;
-(void)option:(UIViewController*)controller;

@property(weak, nonatomic)amanager *apimanager;

@end