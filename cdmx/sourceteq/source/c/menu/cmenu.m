#import "cmenu.h"

@implementation cmenu

-(void)loadView
{
    self.view = [[vair alloc] init:self];
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