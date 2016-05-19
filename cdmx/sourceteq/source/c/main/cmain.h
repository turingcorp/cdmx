#import <UIKit/UIKit.h>

@interface cmain:UIViewController

+(instancetype)singleton;
-(void)menu;
-(void)rootcontroller:(UIViewController*)controller;
-(void)movetocontroller:(UIViewController*)controller;
-(void)pushcontroller:(UIViewController*)controller;

@property(weak, nonatomic, readonly)UIViewController *current;

@end