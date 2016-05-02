#import "cpollution.h"
#import "nsnotification+nsnotificationmain.h"
#import "vpollution.h"

static NSInteger const framespersecond = 60;

@interface cpollution ()

@property(strong, nonatomic)vpollution *view;

@end

@implementation cpollution

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
    [self setPauseOnWillResignActive:YES];
    [self setPreferredFramesPerSecond:framespersecond];
    [self setResumeOnDidBecomeActive:NO];
    [self setDelegate:self];
    
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.view viewdidappear];
}

-(void)loadView
{
    self.view = [[vpollution alloc] init:self];
}

#pragma mark -
#pragma mark glk del

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
    [NSNotification glkmove];
}

@end