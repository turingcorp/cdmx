#import <UIKit/UIKit.h>
#import "ccontroller.h"
#import "mmenu.h"

@interface cmenu:ccontroller

-(void)menuselected:(UIViewController*)controller;

@property(strong, nonatomic, readonly)mmenu *model;

@end