#import "cpages.h"
#import "cmenu.h"
#import "ccity.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];

    ccity *controller = [[ccity alloc] init];
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

#pragma mark functionality

-(void)changecontroller:(UIViewController*)controller direction:(UIPageViewControllerNavigationDirection)direction animated:(BOOL)animated
{
    NSArray *array = @[controller];
    [self setViewControllers:array direction:direction animated:animated completion:nil];
}

#pragma mark public

-(void)pagemenu
{
    cmenu *controller = [[cmenu alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionReverse animated:YES];
}

@end