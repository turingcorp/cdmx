#import "cpages.h"
#import "cpollution.h"
#import "cmenu.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];

    cpollution *controller = [[cpollution alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionForward animated:NO];
    
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    UIStatusBarStyle style = UIStatusBarStyleLightContent;
    
    if(self.viewControllers.count)
    {
        UIViewController *controller = self.viewControllers[0];
        
        style = controller.preferredStatusBarStyle;
    }
    
    return style;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

#pragma mark public

-(void)changecontroller:(UIViewController*)controller direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

-(void)menu
{
    cmenu *controller = [[cmenu alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionReverse animated:YES];
}

@end