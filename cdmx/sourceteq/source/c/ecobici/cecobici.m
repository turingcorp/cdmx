#import "cecobici.h"
#import "cmain.h"
#import "vecobici.h"
#import "mecobici.h"
#import "analytics.h"

@interface cecobici ()

@property(strong, nonatomic)vecobici *view;
@property(weak, nonatomic, readonly)cmain *parentViewController;
@property(strong, nonatomic, readwrite)mecobici *model;

@end

@implementation cecobici

@end


#import "cclimate.h"
#import "cmain.h"
#import "vclimate.h"
#import "aparserclimate.h"
#import "enotification.h"
#import "analytics.h"



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
                       welf.apimanager = [amanager call:[acall climate] delegate:welf];
                   });
    
    [[analytics singleton] trackscreen:self];
}

-(void)menu
{
    [self.parentViewController menu];
}

#pragma mark -
#pragma mark call del

-(void)callsuccess:(amanager*)manager
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),
                   ^
                   {
                       aparserclimate *parser = (aparserclimate*)manager.call.parser;
                       
                       if(parser.climate)
                       {
                           welf.model = parser.climate;
                           mclimatecurrent *modelcurrent = [welf.model current];
                           
                           dispatch_async(dispatch_get_main_queue(),
                                          ^
                                          {
                                              [welf.view climateloaded:modelcurrent];
                                          });
                       }
                   });
}

-(void)call:(amanager*)manager error:(NSString*)error
{
    __weak typeof(self) welf = self;
    
    dispatch_async(dispatch_get_main_queue(),
                   ^
                   {
                       welf.model = nil;
                       [welf.view error:error];
                   });
}

@end