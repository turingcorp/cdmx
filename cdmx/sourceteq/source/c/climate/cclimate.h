#import <UIKit/UIKit.h>
#import "acalldelegate.h"
#import "amanager.h"
#import "mclimate.h"

@interface cclimate:UIViewController<acalldelegate>

-(void)loadclimate;
-(void)menu;
-(void)forecast;

@property(weak, nonatomic)amanager *apimanager;
@property(strong, nonatomic, readonly)mclimate *model;

@end