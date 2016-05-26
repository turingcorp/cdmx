#import <UIKit/UIKit.h>

@interface cmain:UIViewController

-(void)menu;
-(void)rootcontroller:(UIViewController*)controller;
-(void)movetocontroller:(UIViewController*)controller;
-(void)pushcontroller:(UIViewController*)controller;
-(void)back;

@property(strong, nonatomic, readonly)NSMutableArray<UIViewController*> *previous;
@property(weak, nonatomic, readonly)UIViewController *current;

@end