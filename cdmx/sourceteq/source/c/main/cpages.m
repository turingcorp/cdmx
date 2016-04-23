#import "cpages.h"
#import "cmenu.h"

@implementation cpages

-(instancetype)init
{
    self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];

    self.model = [[mpages alloc] init];
    [self page:self.model.sections[0].items[0] animated:YES direction:UIPageViewControllerNavigationDirectionForward];
    
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
    return UIStatusBarStyleLightContent;
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

-(void)page:(mpagesitem*)model animated:(BOOL)animated direction:(UIPageViewControllerNavigationDirection)direction
{
    UIViewController *controller = [model controller];
    [self changecontroller:controller direction:direction animated:animated];
}

-(void)pagemenu
{
    cmenu *controller = [[cmenu alloc] init];
    [self changecontroller:controller direction:UIPageViewControllerNavigationDirectionReverse animated:YES];
}

@end