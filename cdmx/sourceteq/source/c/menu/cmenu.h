#import <UIKit/UIKit.h>
#import "mmenu.h"

@interface cmenu:UIViewController

-(void)menuselected:(UIViewController*)controller;

@property(strong, nonatomic, readonly)mmenu *model;

@end