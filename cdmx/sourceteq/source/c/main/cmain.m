#import "cmain.h"
#import "cpollution.h"
#import "cmenu.h"

@interface cmain ()

@property(weak, nonatomic, readwrite)UIViewController *current;

@end

static CGFloat const menuanimation = 0.5;
static CGFloat const movecontrolleranimation = 0.3;
static CGFloat const pushcontrolleranimation = 1;

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
    
}

@end