#import "cpollution.h"
#import "enotification.h"
#import "cmain.h"
#import "vpollution.h"
#import "aparserpollution.h"
#import "analytics.h"

static NSInteger const framespersecond = 60;

@interface cpollution ()

@property(weak, nonatomic, readonly)cmain *parentViewController;

@end

@implementation cpollution

@dynamic view;
@dynamic parentViewController;

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

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
    [self loadpollution];
    [self activelistener];
}

-(void)loadView
{
    self.view = [[vpollution alloc] init:self];
}

#pragma mark notified

-(void)notifiedbecomeactive:(NSNotification*)notification
{
    [self setPaused:NO];
    [self loadpollution];
}

#pragma mark public

-(void)activelistener
{
    [NSNotification becomeactiveremove:self];
    [NSNotification observe:self becomeactive:@selector(notifiedbecomeactive:)];
}

-(void)loadpollution
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [welf.apimanager cancelcall];
                       welf.apimanager = [amanager call:[acall pollution] delegate:welf];
                   });
    
    [[analytics singleton] trackscreen:self];
}

-(void)menu
{
    [self.view clean];
    [self.model clean];
    [self.parentViewController menu];
}

-(void)option:(UIViewController*)controller
{
    [NSNotification becomeactiveremove:self];
    [self.parentViewController pushcontroller:controller];
    [self.model clean];
    [self.view loading];
}

#pragma mark -
#pragma mark glk del

-(void)glkViewControllerUpdate:(GLKViewController*)controller
{
    [NSNotification glkmove];
}

#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       aparserpollution *parser = (aparserpollution*)manager.call.parser;
                       welf.model = [mpollution loadfromdb:parser.modelhourly];
                       
                       dispatch_async(dispatch_get_main_queue(),
                                      ^
                                      {
                                          [welf.view modelloaded];
                                      });
                   });
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf.model clean];
                       welf.model = nil;
                       [welf.view error:error];
                   });
}

@end