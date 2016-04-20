#import "cmenu.h"
#import "vmenu.h"
#import "analytics.h"

@interface cmenu ()

@property(strong, nonatomic)vmenu *view;

@end

@implementation cmenu

@dynamic view;

-(void)viewDidLoad
{
    [super viewDidLoad];
    [[analytics singleton] trackscreen:ga_screen_menu];
}

-(void)loadView
{
    self.view = [[vmenu alloc] init:self];
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}

@end