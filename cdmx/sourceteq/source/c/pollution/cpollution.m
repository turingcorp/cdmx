#import "cpollution.h"
#import "enotification.h"
#import "cpollutionimeca.h"
#import "cmain.h"
#import "vpollution.h"

static NSInteger const framespersecond = 60;

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
    [self setResumeOnDidBecomeActive:YES];
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

#pragma mark public

-(void)imeca
{
    cpollutionimeca *controller = [[cpollutionimeca alloc] init];
    [[cmain singleton] pushViewController:controller animated:YES];
}

#pragma mark -
#pragma mark glk del

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
    [NSNotification glkmove];
}

@end