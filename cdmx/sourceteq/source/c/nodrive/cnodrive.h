#import <UIKit/UIKit.h>
#import "acalldelegate.h"
#import "amanager.h"
#import "mnodrive.h"

@interface cnodrive:UIViewController<acalldelegate>

-(void)loadnodrive;
-(void)menu;
-(void)calendar;

@property(weak, nonatomic)amanager *apimanager;
@property(strong, nonatomic, readonly)mnodrive *model;

@end