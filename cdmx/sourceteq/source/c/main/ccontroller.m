#import "ccontroller.h"
#import "cmain.h"

@interface ccontroller ()

@property(weak, nonatomic, readonly)cmain *parentViewController;

@end

@implementation ccontroller

@dynamic parentViewController;

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
    
    //    [[analytics singleton] trackscreen:self];
}

#pragma mark public

-(void)back
{
    [self.parentViewController back];
}

-(void)menu
{
    [[cmain singleton] menu];
}

@end