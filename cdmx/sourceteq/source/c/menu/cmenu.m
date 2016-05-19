#import "cmenu.h"
#import "cmain.h"
#import "vmenu.h"

@interface cmenu ()

@property(strong, nonatomic, readwrite)mmenu *model;
@property(strong, nonatomic)vmenu *view;

@end

@implementation cmenu

@dynamic view;

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
}

-(void)loadView
{
    self.view = [[vmenu alloc] init:self];
}

#pragma mark public

-(void)menuselected:(UIViewController*)controller
{
    [[cmain singleton] movetocontroller:controller];
}

@end