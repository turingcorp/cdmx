#import <UIKit/UIKit.h>

@interface cmain:UIViewController

-(void)menu;
-(void)rootcontroller:(UIViewController*)controller;
-(void)movetocontroller:(UIViewController*)controller;
-(void)pushcontroller:(UIViewController*)controller;
-(void)back;

@property(weak, nonatomic, readonly)UIViewController *current;
@property(strong, nonatomic, readonly)UIViewController *previous;

@end