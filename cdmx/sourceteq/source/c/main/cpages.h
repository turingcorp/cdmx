#import <UIKit/UIKit.h>

@interface cpages:UIPageViewController

-(void)pageloading:(BOOL)animated direction:(UIPageViewControllerNavigationDirection)direction;
-(void)loadfinished;

@end