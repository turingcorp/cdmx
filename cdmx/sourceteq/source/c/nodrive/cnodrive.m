#import "cnodrive.h"
#import "cnodrivecalendar.h"
#import "cmain.h"
#import "vnodrive.h"
#import "aparsernodrive.h"
#import "enotification.h"

@interface cnodrive ()

@property(strong, nonatomic)vnodrive *view;
@property(weak, nonatomic, readonly)cmain *parentViewController;
@property(strong, nonatomic, readwrite)mnodrive *model;

@end

@implementation cnodrive

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
    [self loadnodrive];
    
    [NSNotification becomeactiveremove:self];
    [NSNotification observe:self becomeactive:@selector(notifiedbecomeactive:)];
}

-(void)loadView
{
    self.view = [[vnodrive alloc] init:self];
}

#pragma mark notified

-(void)notifiedbecomeactive:(NSNotification*)notification
{
    [self loadnodrive];
}

#pragma mark functionality

-(void)loadnodrive
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [welf.apimanager cancelcall];
                       welf.apimanager = [amanager call:[acall nodrive] delegate:welf];
                   });
}

#pragma mark public

-(void)menu
{
    [self.parentViewController menu];
}

-(void)calendar
{
    if(self.model)
    {
        cnodrivecalendar *controller = [[cnodrivecalendar alloc] init];
        [self.parentViewController pushcontroller:controller];
    }
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       aparsernodrive *parser = (aparsernodrive*)manager.call.parser;
                       
                       if(parser.nodrive)
                       {
                           welf.model = parser.nodrive;
                           
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [welf.view nodriveloaded:[parser.nodrive modeltoday]];
                                          });
                       }
                   });
}

-(void)call:(amanager*)manager error:(NSString*)error
{
#warning "treat error";
}

@end