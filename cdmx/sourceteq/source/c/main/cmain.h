#import <UIKit/UIKit.h>

@interface cmain:UINavigationController

+(instancetype)singleton;
-(void)changecontroller:(UIViewController*)controller animated:(BOOL)animated forward:(BOOL)forward;

@property(weak, nonatomic)UIViewController *current;

@end