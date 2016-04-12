#import "cair.h"
#import "vair.h"
#import "cmain.h"

@interface cair ()

@property(strong, nonatomic)vair *view;

@end

@implementation cair

@dynamic view;

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

#pragma mark public

-(void)openmenu
{
    [[cmain singleton].pages pagemenu];
}

@end