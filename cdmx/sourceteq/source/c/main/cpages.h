#import <UIKit/UIKit.h>
#import "mpages.h"

@interface cpages:UIPageViewController

-(void)pageloading:(BOOL)animated direction:(UIPageViewControllerNavigationDirection)direction;
-(void)loadfinished:(mpages*)model;
-(void)page:(mpagesitem*)model animated:(BOOL)animated direction:(UIPageViewControllerNavigationDirection)direction;
-(void)pagemenu;

@property(strong, nonatomic)mpages *model;

@end