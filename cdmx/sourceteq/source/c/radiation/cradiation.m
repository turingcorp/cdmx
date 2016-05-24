#import "cradiation.h"
#import "cmain.h"
#import "cradiationabout.h"
#import "vradiation.h"
#import "aparserradiation.h"
#import "enotification.h"
#import "analytics.h"

@interface cradiation ()

@property(strong, nonatomic)vradiation *view;
@property(weak, nonatomic, readonly)cmain *parentViewController;

@end

@implementation cradiation

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
}

-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self loadradiation];
    
    [NSNotification becomeactiveremove:self];
    [NSNotification observe:self becomeactive:@selector(notifiedbecomeactive:)];
}

-(void)loadView
{
    self.view = [[vradiation alloc] init:self];
}

#pragma mark notified

-(void)notifiedbecomeactive:(NSNotification*)notification
{
    [self loadradiation];
}

#pragma mark public

-(void)loadradiation
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [welf.apimanager cancelcall];
                       welf.apimanager = [amanager call:[acall radiation] delegate:welf];
                   });
    
    [[analytics singleton] trackscreen:self];
}

-(void)menu
{
    [self.parentViewController menu];
}

-(void)about
{
    [NSNotification becomeactiveremove:self];
    cradiationabout *controller = [[cradiationabout alloc] init];
    [self.parentViewController pushcontroller:controller];
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       aparserradiation *parser = (aparserradiation*)manager.call.parser;
                       
                       if(parser.radiation)
                       {
                           [welf.view radiationloaded:parser.radiation];
                       }
                   });
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       [welf.view error:error];
                   });
}

@end