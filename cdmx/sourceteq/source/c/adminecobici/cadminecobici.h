#import <UIKit/UIKit.h>
#import "ccontroller.h"
#import "madminecobici.h"
#import "acalldelegate.h"
#import "amanager.h"

@interface cadminecobici:ccontroller<acalldelegate>

-(void)pullecobicidata;

@property(strong, nonatomic, readonly)madminecobici *model;
@property(weak, nonatomic)amanager *apimanager;

@end