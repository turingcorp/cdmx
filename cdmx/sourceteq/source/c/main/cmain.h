#import <UIKit/UIKit.h>

@interface cmain:UINavigationController

+(instancetype)singleton;
-(void)menu;
-(void)changecontroller:(UIViewController*)controller;

@property(weak, nonatomic)UIViewController *current;

@end