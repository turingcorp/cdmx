#import "cmenu.h"
#import "cmain.h"
#import "vmenu.h"
#import "analytics.h"

@interface cmenu ()

@property(weak, nonatomic, readonly)cmain *parentViewController;
@property(strong, nonatomic, readwrite)mmenu *model;
@property(strong, nonatomic)vmenu *view;

@end

@implementation cmenu

@dynamic view;
@dynamic parentViewController;

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setEdgesForExtendedLayout:UIRectEdgeNone];
    [self setExtendedLayoutIncludesOpaqueBars:NO];
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
    self.model = [[mmenu alloc] init];
    
    [[analytics singleton] trackscreen:self];
}

-(void)loadView
{
    self.view = [[vmenu alloc] init:self];
}

#pragma mark public

-(void)menuselected:(UIViewController*)controller
{
    [self.parentViewController movetocontroller:controller];
}

@end