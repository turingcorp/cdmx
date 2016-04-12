#import <UIKit/UIKit.h>
#import "mpages.h"

@interface cpages:UIPageViewController

-(void)pageloading:(BOOL)animated direction:(UIPageViewControllerNavigationDirection)direction;
-(void)loadfinished:(mpages*)model;

@property(strong, nonatomic)mpages *model;

@end