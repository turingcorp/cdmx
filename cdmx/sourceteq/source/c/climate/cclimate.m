#import "cclimate.h"
#import "cmain.h"
#import "vclimate.h"
//#import "aparsernodrive.h"
#import "enotification.h"
#import "analytics.h"

@interface cclimate ()

@property(strong, nonatomic)vclimate *view;
@property(weak, nonatomic, readonly)cmain *parentViewController;
@property(strong, nonatomic, readwrite)mclimate *model;

@end

@implementation cclimate

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
    [self loadclimate];
    
    [NSNotification becomeactiveremove:self];
    [NSNotification observe:self becomeactive:@selector(notifiedbecomeactive:)];
}

-(void)loadView
{
    self.view = [[vclimate alloc] init:self];
}

#pragma mark notified

-(void)notifiedbecomeactive:(NSNotification*)notification
{
    [self loadclimate];
}

#pragma mark public

-(void)loadclimate;
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       [welf.apimanager cancelcall];
                       //welf.apimanager = [amanager call:[acall nodrive] delegate:welf];
                   });
    
    [[analytics singleton] trackscreen:self];
}

-(void)menu
{
    [self.parentViewController menu];
}

-(void)forecast
{
    
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
//                       aparsernodrive *parser = (aparsernodrive*)manager.call.parser;
//                       
//                       if(parser.nodrive)
//                       {
//                           welf.model = parser.nodrive;
//                           mnodrivetoday *modeltoday = [parser.nodrive modeltoday];
//                           
//                           dispatch_async(dispatch_get_main_queue(),
//                                          ^
//                                          {
//                                              [welf.view nodriveloaded:modeltoday];
//                                          });
//                       }
                   });
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       welf.model = nil;
//                       [welf.view error:error];
                   });
}

@end