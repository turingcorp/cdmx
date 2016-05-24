#import <UIKit/UIKit.h>
#import "acalldelegate.h"
#import "amanager.h"

@interface cradiation:UIViewController<acalldelegate>

-(void)loadradiation;
-(void)menu;
-(void)about;

@property(weak, nonatomic)amanager *apimanager;

@end