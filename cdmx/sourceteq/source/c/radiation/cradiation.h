#import <UIKit/UIKit.h>
#import "acalldelegate.h"
#import "amanager.h"

@interface cradiation:UIViewController<acalldelegate>

-(void)menu;

@property(weak, nonatomic)amanager *apimanager;

@end