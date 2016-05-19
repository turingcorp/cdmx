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

+(instancetype)singleton
{
    static cmain *single;
    static dispatch_once_t once;
    dispatch_once(&once, ^(void) { single = [[self alloc] init]; });
    
    return single;
}

-(instancetype)init
{
    self = [super init];
    cpollution *controller = [[cpollution alloc] init];
    [self rootcontroller:controller];
    
    return self;
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
    [view setBackgroundColor:[UIColor colorWithWhite:0 alpha:0.1]];
    
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
    
    [shade setFrame:rect];
    [controller.view setFrame:movingenteringrect];
    
    [welf.current willMoveToParentViewController:nil];
    [welf addChildViewController:controller];
    
    [welf transitionFromViewController:welf.current toViewController:controller duration:pushcontrolleranimation options:UIViewAnimationOptionCurveEaseOut animations:
     ^{
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
    [welf.previous.view setFrame:movingenteringrect];
    
    [welf.current willMoveToParentViewController:nil];
    [welf addChildViewController:welf.previous];
    
    [welf transitionFromViewController:welf.current toViewController:welf.previous duration:pushcontrolleranimation options:UIViewAnimationOptionCurveEaseOut animations:
     ^{
         [welf.previous.view setFrame:rect];
         [welf.current.view setFrame:currentleavingrect];
         [welf.view insertSubview:shade belowSubview:welf.previous.view];
     } completion:
     ^(BOOL done)
     {
         [welf.current removeFromParentViewController];
         [welf.previous didMoveToParentViewController:welf];
         [shade removeFromSuperview];
         welf.current = welf.previous;
         welf.previous = nil;
     }];
}

@end