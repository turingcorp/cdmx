#import "ccity.h"
#import "nsnotification+nsnotificationmain.h"

static NSInteger const framespersecond = 60;

@implementation ccity

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
    [self setPauseOnWillResignActive:YES];
    [self setPreferredFramesPerSecond:framespersecond];
    [self setResumeOnDidBecomeActive:NO];
    [self setDelegate:self];
    
}

#pragma mark -
#pragma mark glk del

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
    [NSNotification glkmove];
}

@end