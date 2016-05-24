#import "cmain.h"
#import "cpollution.h"
#import "cmenu.h"

@interface cmain ()

@property(weak, nonatomic, readwrite)UIViewController *current;
@property(strong, nonatomic, readwrite)UIViewController *previous;

@end

static CGFloat const menuanimation = 0.4;
static CGFloat const movecontrolleranimation = 0.3;
static CGFloat const pushcontrolleranimation = 0.3;

@implementation cmain

-(instancetype)init
{
    self = [super init];
    cpollution *controller = [[cpollution alloc] init];
    [self rootcontroller:controller];
    
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return [self.current preferredStatusBarStyle];
}

-(BOOL)prefersStatusBarHidden
{
    return [self.current prefersStatusBarHidden];
}

#pragma mark functionality

-(CGRect)contentframe
{
    CGRect rect = self.view.bounds;
    
    return rect;
}

-(UIView*)shade
{
    UIView *view = [[UIView alloc] init];
    [view setUserInteractionEnabled:NO];
    [view setClipsToBounds:YES];
    [view setBackgroundColor:[UIColor blackColor]];
    
    return view;
}

#pragma mark public

-(void)menu
{
    __weak typeof(self) welf = self;
    
    cmenu *menu = [[cmenu alloc] init];
    CGRect rect = [welf contentframe];
    CGRect currentleavingrect = CGRectMake(rect.origin.x, rect.origin.y - rect.size.height, rect.size.width, rect.size.height);
    CGRect menumovingrect = CGRectMake(rect.origin.x, rect.origin.y + rect.size.height, rect.size.width, rect.size.height);
    
    [welf.current willMoveToParentViewController:nil];
    [welf addChildViewController:menu];
    [menu.view setFrame:menumovingrect];
    [welf transitionFromViewController:welf.current toViewController:menu duration:menuanimation options:UIViewAnimationOptionCurveEaseOut animations:
     ^{
         [menu.view setFrame:rect];
         [welf.current.view setFrame:currentleavingrect];
     } completion:
     ^(BOOL done)
     {
         [welf.current removeFromParentViewController];
         [menu didMoveToParentViewController:welf];
         welf.current = menu;
     }];
}

-(void)rootcontroller:(UIViewController*)controller
{
    self.current = controller;
    [self addChildViewController:controller];
    [controller.view setFrame:self.view.bounds];
    [self.view addSubview:controller.view];
    [controller didMoveToParentViewController:self];
    
    [self setNeedsStatusBarAppearanceUpdate];
}

-(void)movetocontroller:(UIViewController*)controller
{
    __weak typeof(self) welf = self;
    
    CGRect rect = [welf contentframe];
    CGRect currentleavingrect = CGRectMake(rect.origin.x - rect.size.width, rect.origin.y, rect.size.width, rect.size.height);
    CGRect movingenteringrect = CGRectMake(rect.origin.x + rect.size.width, rect.origin.y, rect.size.width, rect.size.height);
    [welf.current willMoveToParentViewController:nil];
    [welf addChildViewController:controller];
    [controller.view setFrame:movingenteringrect];
    [welf transitionFromViewController:welf.current toViewController:controller duration:movecontrolleranimation options:UIViewAnimationOptionCurveEaseOut animations:
     ^{
         [welf.current.view setFrame:currentleavingrect];
         [controller.view setFrame:rect];
     } completion:
     ^(BOOL done)
     {
         [welf.current removeFromParentViewController];
         [controller didMoveToParentViewController:welf];
         welf.current = controller;
         
         [welf setNeedsStatusBarAppearanceUpdate];
     }];
}

-(void)pushcontroller:(UIViewController*)controller
{
    __weak typeof(self) welf = self;
    
    CGRect rect = [welf contentframe];
    CGFloat rectx = rect.origin.x;
    CGFloat recty = rect.origin.y;
    CGFloat rectwidth = rect.size.width;
    CGFloat rectheight = rect.size.height;
    CGRect movingenteringrect = CGRectMake(rectx + rectwidth, recty, rectwidth, rectheight);
    CGRect currentleavingrect = CGRectMake(rectx - (rectwidth / 2.0), recty, rectwidth, rectheight);
    UIView *shade = [welf shade];
    
    [shade setAlpha:0];
    [shade setFrame:rect];
    [controller.view setFrame:movingenteringrect];
    
    [welf.current willMoveToParentViewController:nil];
    [welf addChildViewController:controller];
    
    [welf transitionFromViewController:welf.current toViewController:controller duration:pushcontrolleranimation options:UIViewAnimationOptionCurveEaseOut animations:
     ^{
         [shade setAlpha:0.2];
         [controller.view setFrame:rect];
         [welf.current.view setFrame:currentleavingrect];
         [welf.view insertSubview:shade belowSubview:controller.view];
     } completion:
     ^(BOOL done)
     {
         welf.previous = welf.current;
         [welf.current removeFromParentViewController];
         [controller didMoveToParentViewController:welf];
         [shade removeFromSuperview];
         welf.current = controller;
         
         [welf setNeedsStatusBarAppearanceUpdate];
     }];
}

-(void)back
{
    __weak typeof(self) welf = self;
    
    CGRect rect = [welf contentframe];
    CGFloat rectx = rect.origin.x;
    CGFloat recty = rect.origin.y;
    CGFloat rectwidth = rect.size.width;
    CGFloat rectheight = rect.size.height;
    CGRect currentleavingrect = CGRectMake(rectx + rectwidth, recty, rectwidth, rectheight);
    CGRect movingenteringrect = CGRectMake(rectx - (rectwidth / 2.0), recty, rectwidth, rectheight);
    UIView *shade = [welf shade];
    
    [shade setFrame:rect];
    [shade setAlpha:0.2];
    [welf.previous.view setFrame:movingenteringrect];
    
    [welf.current willMoveToParentViewController:nil];
    [welf addChildViewController:welf.previous];
    
    [welf transitionFromViewController:welf.current toViewController:welf.previous duration:pushcontrolleranimation options:UIViewAnimationOptionCurveEaseOut animations:
     ^{
         [shade setAlpha:0];
         [welf.previous.view setFrame:rect];
         [welf.current.view setFrame:currentleavingrect];
         [welf.view bringSubviewToFront:welf.current.view];
         [welf.view insertSubview:shade belowSubview:welf.current.view];
     } completion:
     ^(BOOL done)
     {
         [welf.current removeFromParentViewController];
         [welf.previous didMoveToParentViewController:welf];
         [shade removeFromSuperview];
         welf.current = welf.previous;
         welf.previous = nil;
         
         [welf setNeedsStatusBarAppearanceUpdate];
     }];
}

@end