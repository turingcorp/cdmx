#import "cmenu.h"
#import "vmenu.h"

@interface cmenu ()

@property(strong, nonatomic)vmenu *view;

@end

@implementation cmenu

@dynamic view;

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